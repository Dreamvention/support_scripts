<?php
$rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator(getcwd()));

if(!$rii){
	echo "no iterator!";
	return;
}

// File you want to edit
$find = 'config.php';

//Path you want to edit
$find_in_file = 'D:/Ya/OSpanel/OSPanel/domains/opencart/302/d_contact_map/';

//New path
$replace_in_file = 'home/kaktus/';

//Old database user from config file
$old_db_user = 'root';

//New database user
$new_db_user = 'ARSEN';

//Old database password from config file
$old_db_password = '123213156123';

//New database password;
$new_db_password = '111';

//Backup file extension
$last = 'txt';

// NOTHING TO CHANGE HERE!
$files = array();

$stored_files = array();

foreach ($rii as $file) {

    if ($file->isDir()){ 
        continue;
    }

    if(strpos($file->getPathname(), $find)){
    	$files[] = $file->getPathname(); 
    }
    
}


foreach ($files as $file) {
	$feed = explode('.', $file);

	$new_strings = array();

	array_pop($feed);
	array_push($feed, $last);

	$feed = implode('.', $feed);

	$stored_files[] = $feed; 
}

foreach($files as $index => $file) {
   rename($file, $stored_files[$index]);
}


foreach ($stored_files as $index => $s_file) {

	$newfile = fopen($files[$index], "w");
	fclose($newfile);
	
	$paths = file_put_contents($files[$index], str_replace($find_in_file, $replace_in_file, file_get_contents($s_file)));
	$db_user = file_put_contents($files[$index], str_replace($old_db_user, $new_db_user, file_get_contents($files[$index])));
	$db_password = file_put_contents($files[$index], str_replace($old_db_password, $new_db_password, file_get_contents($files[$index])));

	if($paths && $db_user && $db_password) {
		echo $files[$index] . ' ' ."<strong>updated!</strong> <br><br>";
	} else {
		echo $files[$index] . ' ' ."<strong style=" . 'color:red' . ">can't be updated!</strong> <br><br>";
	}

	
}	