<?php
@ini_set('max_execution_time',0);
@set_time_limit(0);
@set_magic_quotes_runtime(0);

session_start();

$cur_dir = realpath(".") . "/";
$path = '';

if (isset($_SESSION['cur_dir'])) $cur_dir = $_SESSION['cur_dir'];
if (isset($_GET['path'])) $path = urldecode($_GET['path']);

chdir($cur_dir);

if ($path) {
	if ($path=="..") {
		chdir("..");
		$cur_dir = realpath(".") . "/";
	} else {
		if (is_dir($cur_dir . $path . "/")) {
			$cur_dir .= $path . "/";
			chdir($cur_dir);
		}
	}
}

$_SESSION['cur_dir'] = $cur_dir;

$selected_elements = array();
$filename = '';
$extract_path = $cur_dir;
$action = 'zip';
$info = '';

if (isset($_POST['element'])) $selected_elements = $_POST['element'];
if (isset($_POST['filename'])) $filename = $_POST['filename'];
if (isset($_POST['extract_path'])) $extract_path = $_POST['extract_path'];
if (isset($_POST['action'])) $action = $_POST['action'];


$zip = new Zip($cur_dir);

if (isset($_POST['action'])) {
	if ($action == 'zip') {
		if ($selected_elements) {
			if ($filename) {
				$result = $zip->zip($selected_elements, $filename);
				if ($result) {
					$info = 'Archiving is sucessful!';
				} else {
					$info = 'Error, can\'t create a zip file!';
				}
			} else {
				$info = 'Please, write filename of your zip file!';
			}
		} else {
			$info = 'Please, choose dirs or files, which you want to compress!';
		}
	}
	if ($action == 'unzip') {
		if ($selected_elements) {
			if ($extract_path && is_dir($extract_path)) {
				$result = $zip->unzip($selected_elements[0], $extract_path);
				if ($result) {
					$info = 'Uncompress is sucessful!';
				} else {
					$info = 'Error, can\'t uncompress zip file!';
				}
			} else {
				$info = 'Please, write extract path which you want to uncompress zip file!';
			}
		} else {
			$info = 'Please, choose zip file, which you want to uncompress!';
		}
	}
	if ($action == 'delete') {
		if ($selected_elements) {
			$result = $zip->delete($selected_elements);
			if ($result) {
				$info = 'Deleting is sucessful!';
			} else {
				$info = 'Error, can\'t deletee files or dirs!';
			}
		} else {
			$info = 'Please, choose dirs or files, which you want to delete!';
		}
	}
}

$elements = $zip->get_elements();

class Zip {
	
	private $cur_dir;
	
	public function __construct($cur_dir) {
		$this->cur_dir = $cur_dir;
	}
		
	public function zip($elements, $filename) {
		
		$arr_elements = array();
		
		foreach ($elements as $element) {
			if ($element) {
				if (is_dir($this->cur_dir . $element)) {
					if ($this->is_empty_dir($this->cur_dir . $element)) $arr_elements[] = array('name' => (string)$element, 'type' => 'dir');
					$this->scan_dir($this->cur_dir . $element, $arr_elements);
				} 
				if (is_file($this->cur_dir . $element)) {
					$arr_elements[] = array('name' => (string)$element, 'type' => 'file');
				}
			}
		}
		
        $zip = new ZipArchive();
		
		$res = $zip->open($this->cur_dir . $filename . '.zip', ZipArchive::CREATE | ZipArchive::OVERWRITE);
		if ($res === TRUE) {
			foreach ($arr_elements as $element) {
				$element['name'] = str_replace($this->cur_dir, "", $element['name']);
				if ($element['type']=='dir') {
					$zip->addEmptyDir($element['name']); 
				}
				if ($element['type']=='file') {
					$zip->addFile($this->cur_dir . $element['name'], $element['name']);
				}    
			}	
			$zip->close();
			
			return true;
        }

		return false;
    }
	
	public function unzip($filename, $extract_path){
		
		$zip = new ZipArchive();
 
		$res = $zip->open($this->cur_dir . $filename);
		if ($res === TRUE) {
			$zip->extractTo($extract_path);
			$zip->close();
			return true;
		}
		
		return false;
	}
	
	public function delete($elements) {
		
		$arr_elements = array();
				
		foreach ($elements as $element) {
			if ($element) {
				if (is_dir($this->cur_dir . $element)) {
					$this->delete_dir($this->cur_dir . $element);
				} 
				if (is_file($this->cur_dir . $element)) {
					unlink($this->cur_dir . $element);
				}
			}
		}
		
		return true;
    }
	
	public function get_elements() {
		
		$elements = array();
		
        if (is_dir($this->cur_dir)) {
			$handle = opendir($this->cur_dir);
            while ($element = readdir($handle)) {
				if ($element == '..') $elements[] = array('name' => $element, 'type' => 'dir', 'href' => urlencode($element));
            }
            closedir($handle);
			
            $handle = opendir($this->cur_dir);
            while ($element = readdir($handle)) {
				if ($element == '.' or $element == '..') continue;
				if (is_dir($element)) $elements[] = array('name' => $element, 'type' => 'dir', 'href' => urlencode($element));
            }
            closedir($handle);
			
			$handle = opendir($this->cur_dir);
            while ($element = readdir($handle)) {
				if ($element == '.' or $element == '..') continue;
				if (is_file($element)) $elements[] = array('name' => $element, 'type' => 'file');
            }
            closedir($handle);
        }
		
		return $elements;
    }

	private function scan_dir($dir, &$arr_elements) {
        
		if (is_dir($dir)) {
			if ($this->is_empty_dir($dir)) $arr_elements[] = array('name' => $dir, 'type' => 'dir');
            $handle = opendir($dir);
            while ($element = readdir($handle)) {
                if ($element == '.' or $element == '..')
                    continue;
                if (is_file($element))
                    $arr_elements[] = array('name' => $dir . "/" . $element, 'type' => 'file');
                else
                    $this->scan_dir($dir . "/" . $element, $arr_elements);
            }
            closedir($handle);
        } else {
            $arr_elements[] = array('name' => $dir, 'type' => 'file');
        }
		
    }
	
    private function move_dir($dir, $dest, &$result) {
		if (is_dir($dir)) {
			$elements = scandir($dir);
			foreach ($elements as $element) {

				if ($element == '.' || $element == '..' || $element == '.DS_Store')
					continue;

				if (is_dir($dir . $element)) {
					if (!file_exists($dest . $element . '/')) {
						mkdir($dest . $element . '/', 0777, true);
					}
					$this->move_dir($dir . $element . '/', $dest . $element . '/', $result);
				} elseif (rename($dir . $element, $dest . $element)) {
					$result['success'][] = str_replace($this->cur_dir, '', $dest . $element);
				} else {
					$result['error'][] = str_replace($this->cur_dir, '', $dest . $element);
				}
			}

			$this->delete_dir($dir);
		}
    }

    private function delete_dir($dir) {
        if (is_dir($dir)) {
            $elements = scandir($dir);
            foreach ($elements as $element) {
                if ($element != "." && $element != "..") {
                    if (filetype($dir . "/" . $element) == "dir")
                        $this->delete_dir($dir . "/" . $element);
                    else
                        unlink($dir . "/" . $element);
                }
            }
            reset($elements);
            rmdir($dir);
        }
    }

    private function is_empty_dir($dir) {
        if (!is_readable($dir))
            return true;

        $handle = opendir($dir);
        while (false !== ($entry = readdir($handle))) {
            if ($entry != "." && $entry != "..") {
                return false;
            }
        }
        return true;
    }
	
}

?>

<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Zipper</title>
<style type="text/css">
.info {
	display: block;
	margin-bottom: 10px;
	color: #900;
}
.elements {
	display:block;
	width: 100%;
	height: 400px;
	overflow: auto;
	border: 1px solid #000;
}
.element:nth-child(even) {
	background: #999;
}
.element:nth-child(odd) {
	background: #f0f0f0;
}
.element .dir {
	display: inline-block;
	text-decoration: none;
	color: #0000d0;
}
.element .dir:visited {
   color: #0000d0;
}
.element .file {
	color: #000;
}
.element .check {
	display: inline-block;
	width: 50px;
}
.tools .tool {
	margin: 10px 0px;
}
.tools label {
	display: inline-block;
	width: 200px;
}
.tools input[type="text"], select {
	width: 500px;
}
.hide {
	display: none;
}
</style>
</head>
<body>
	<form action="?" method="post">
	<h3><?php echo $cur_dir; ?></h3>
	<div class="info"><?php echo $info; ?></div>
	<div class="elements">
	<?php foreach($elements as $element) { ?>
		<div class="element">
		<?php if ($element['type']=='dir') { ?>
			<div class="check"><?php if ($element['name']!='..') { ?><input type="checkbox" name="element[]" value="<?php echo $element['name']; ?>"><?php } ?></div>
			<a href="?path=<?php echo $element['href']; ?>" class="dir"><?php echo $element['name']; ?></a>
		<?php } ?>
		<?php if ($element['type']=='file') { ?>
			<div class="check"><input type="checkbox" name="element[]" value="<?php echo $element['name']; ?>"></div>
			<span class="file"><?php echo $element['name']; ?></span>
		<?php } ?>
		</div>
	<?php } ?>
	</div>
	<div class="tools">
		<div class="tool">
			<label>Action</label>
			<select name="action" id="action" onchange="changeAction();">
				<option value="zip" <?php if ($action=='zip') { ?> selected <?php } ?>>Pack</option>
				<option value="unzip" <?php if ($action=='unzip') { ?> selected <?php } ?>>Unpack</option>
				<option value="delete" <?php if ($action=='delete') { ?> selected <?php } ?>>Delete</option>
			</select>
		</div>
		<div class="tool" id="filename">
			<td><label>Zip Filename</label></td>
			<td><input type="text" name="filename" value="<?php echo $filename; ?>"></td>
		</div>
		<div class="tool" id="extract_path">
			<td><label>Extract Path</label></td>
			<td><input type="text" name="extract_path" value="<?php echo $extract_path; ?>"></td>
		</div>
		<div class="tool">
			<input type="submit" value="Perform">
		</div>
	</table>
	</div>
	</form>
</body>	
<script type="text/javascript">
	
	changeAction();
	
	function changeAction() {
		var e = document.getElementById("action");
		if (e.options[e.selectedIndex].value=='zip') {
			e = document.getElementById("filename").style.display='block';
			e = document.getElementById("extract_path").style.display='none';
		} 
		if (e.options[e.selectedIndex].value=='unzip') {
			e = document.getElementById("extract_path").style.display='block';
			e = document.getElementById("filename").style.display='none';
		}
		if (e.options[e.selectedIndex].value=='delete') {
			e = document.getElementById("filename").style.display='none';
			e = document.getElementById("extract_path").style.display='none';
		}
	}
</script>
</html>