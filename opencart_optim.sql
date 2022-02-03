-- ALTER TABLE `oc_api_ip` ADD INDEX `api_id` (`api_id`);

-- ALTER TABLE `oc_api_session` ADD INDEX `api_id` (`api_id`);
ALTER TABLE `oc_api_session` ADD INDEX `session_id` (`session_id`);

ALTER TABLE `oc_address` ADD INDEX `oc_address` (`customer_id`);

ALTER TABLE `oc_attribute` ADD INDEX `attribute_group_id` (`attribute_group_id`);
ALTER TABLE `oc_attribute` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_attribute_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_attribute_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_attribute_group` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_attribute_group_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_attribute_group_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_banner` ADD INDEX `status` (`status`);

ALTER TABLE `oc_banner_image` ADD INDEX `banner_id` (`banner_id`);
ALTER TABLE `oc_banner_image` ADD INDEX `language_id` (`language_id`);

ALTER TABLE `oc_category` ADD INDEX `parent_id` (`parent_id`);
ALTER TABLE `oc_category` ADD INDEX `status` (`status`);
ALTER TABLE `oc_category` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_category_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_category_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_category_filter` ADD INDEX `filter_id` (`filter_id`);

ALTER TABLE `oc_category_path` ADD INDEX `path_id` (`path_id`);
ALTER TABLE `oc_category_path` ADD INDEX `level` (`level`);

ALTER TABLE `oc_category_to_layout` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_category_to_layout` ADD INDEX `layout_id` (`layout_id`);

ALTER TABLE `oc_category_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_coupon` ADD INDEX `status` (`status`);

ALTER TABLE `oc_coupon_category` ADD INDEX `category_id` (`category_id`);

ALTER TABLE `oc_coupon_history` ADD INDEX `coupon_id` (`coupon_id`);
ALTER TABLE `oc_coupon_history` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_coupon_history` ADD INDEX `customer_id` (`customer_id`);

ALTER TABLE `oc_coupon_product` ADD INDEX `coupon_id` (`coupon_id`);
ALTER TABLE `oc_coupon_product` ADD INDEX `product_id` (`product_id`);

ALTER TABLE `oc_currency` ADD INDEX `code` (`code`);
ALTER TABLE `oc_currency` ADD INDEX `status` (`status`);

ALTER TABLE `oc_customer` ADD INDEX `customer_group_id` (`customer_group_id`);
ALTER TABLE `oc_customer` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_customer` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_customer` ADD INDEX `status` (`status`);

ALTER TABLE `oc_customer_activity` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_customer_activity` ADD INDEX `key` (`key`);

ALTER TABLE `oc_customer_approval` ADD INDEX `customer_id` (`customer_id`);

ALTER TABLE `oc_customer_group` ADD INDEX `approval` (`approval`);
ALTER TABLE `oc_customer_group` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_customer_group_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_customer_group_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_customer_history` ADD INDEX `customer_id` (`customer_id`);

ALTER TABLE `oc_customer_login` ADD INDEX `email` (`email`);
ALTER TABLE `oc_customer_login` ADD INDEX `ip` (`ip`);

ALTER TABLE `oc_customer_ip` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_customer_ip` ADD INDEX `ip` (`ip`);

ALTER TABLE `oc_customer_online` ADD INDEX `customer_id` (`customer_id`);

ALTER TABLE `oc_customer_reward` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_customer_reward` ADD INDEX `order_id` (`order_id`);

ALTER TABLE `oc_customer_transactiond` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_customer_transaction` ADD INDEX `order_id` (`order_id`);

ALTER TABLE `oc_customer_search` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_customer_search` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_customer_search` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_customer_search` ADD INDEX `keyword` (`keyword`);
ALTER TABLE `oc_customer_search` ADD INDEX `category_id` (`category_id`);

ALTER TABLE `oc_custom_field` ADD INDEX `status` (`status`);
ALTER TABLE `oc_custom_field` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_custom_field_customer_group` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_custom_field_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_custom_field_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_custom_field_value` ADD INDEX `custom_field_id` (`custom_field_id`);
ALTER TABLE `oc_custom_field_value` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_custom_field_value_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_custom_field_value_description` ADD INDEX `custom_field_id` (`custom_field_id`);
ALTER TABLE `oc_custom_field_value_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_download_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_download_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_event` ADD INDEX `code` (`code`);
ALTER TABLE `oc_event` ADD INDEX `status` (`status`);
ALTER TABLE `oc_event` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_extension` ADD INDEX `type` (`type`);
ALTER TABLE `oc_extension` ADD INDEX `code` (`code`);

ALTER TABLE `oc_extension_install` ADD INDEX `extension_download_id` (`extension_download_id`);

ALTER TABLE `oc_extension_path` ADD INDEX `extension_install_id` (`extension_install_id`);

ALTER TABLE `oc_filter` ADD INDEX `filter_group_id` (`filter_group_id`);
ALTER TABLE `oc_filter` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_filter_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_filter_description` ADD INDEX `filter_group_id` (`filter_group_id`);
ALTER TABLE `oc_filter_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_filter_group` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_filter_group_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_filter_group_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_information` ADD INDEX `status` (`status`);
ALTER TABLE `oc_information` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_information_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_information_description` ADD INDEX `title` (`title`);

ALTER TABLE `oc_information_to_layout` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_information_to_layout` ADD INDEX `layout_id` (`layout_id`);

ALTER TABLE `oc_information_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_language` ADD INDEX `name` (`name`);
ALTER TABLE `oc_language` ADD INDEX `code` (`code`);
ALTER TABLE `oc_language` ADD INDEX `status` (`status`);
ALTER TABLE `oc_language` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_layout_module` ADD INDEX `layout_id` (`layout_id`);
ALTER TABLE `oc_layout_module` ADD INDEX `code` (`code`);
ALTER TABLE `oc_layout_module` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_layout_route` ADD INDEX `layout_id` (`layout_id`);
ALTER TABLE `oc_layout_route` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_layout_route` ADD INDEX `route` (`route`);

ALTER TABLE `oc_manufacturer` ADD INDEX `name` (`name`);
ALTER TABLE `oc_manufacturer` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_manufacturer_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_modification` ADD INDEX `extension_install_id` (`extension_install_id`);
ALTER TABLE `oc_modification` ADD INDEX `name` (`name`);
ALTER TABLE `oc_modification` ADD INDEX `code` (`code`);
ALTER TABLE `oc_modification` ADD INDEX `status` (`status`);

ALTER TABLE `oc_module` ADD INDEX `name` (`name`);
ALTER TABLE `oc_module` ADD INDEX `code` (`code`);

ALTER TABLE `oc_option` ADD INDEX `type` (`type`);
ALTER TABLE `oc_option` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_option_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_option_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_option_value` ADD INDEX `option_id` (`option_id`);
ALTER TABLE `oc_option_value` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_option_value_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_option_value_description` ADD INDEX `option_id` (`option_id`);
ALTER TABLE `oc_option_value_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_order` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_order` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_order` ADD INDEX `customer_group_id` (`customer_group_id`);
ALTER TABLE `oc_order` ADD INDEX `order_status_id` (`order_status_id`);

ALTER TABLE `oc_order_history` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_history` ADD INDEX `order_status_id` (`order_status_id`);

ALTER TABLE `oc_order_option` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_option` ADD INDEX `order_product_id` (`order_product_id`);
ALTER TABLE `oc_order_option` ADD INDEX `product_option_id` (`product_option_id`);
ALTER TABLE `oc_order_option` ADD INDEX `product_option_value_id` (`product_option_value_id`);

ALTER TABLE `oc_order_product` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_product` ADD INDEX `product_id` (`product_id`);

ALTER TABLE `oc_order_recurring` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_recurring` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_order_recurring` ADD INDEX `recurring_id` (`recurring_id`);
ALTER TABLE `oc_order_recurring` ADD INDEX `status` (`status`);

ALTER TABLE `oc_order_recurring_transaction` ADD INDEX `order_recurring_id` (`order_recurring_id`);

ALTER TABLE `oc_order_shipment` ADD INDEX `order_id` (`order_id`);

ALTER TABLE `oc_order_status` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_order_status` ADD INDEX `name` (`name`);

ALTER TABLE `oc_order_total` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_total` ADD INDEX `code` (`code`);
ALTER TABLE `oc_order_total` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_order_voucher` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_order_voucher` ADD INDEX `voucher_id` (`voucher_id`);
ALTER TABLE `oc_order_voucher` ADD INDEX `code` (`code`);

ALTER TABLE `oc_product` ADD INDEX `status` (`status`);
ALTER TABLE `oc_product` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_product_attribute` ADD INDEX `attribute_id` (`attribute_id`);
ALTER TABLE `oc_product_attribute` ADD INDEX `language_id` (`language_id`);

ALTER TABLE `oc_product_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_product_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_product_discount` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_discount` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_product_filter` ADD INDEX `filter_id` (`filter_id`);

ALTER TABLE `oc_product_image` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_image` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_product_option` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_option` ADD INDEX `option_id` (`option_id`);

ALTER TABLE `oc_product_option_value` ADD INDEX `product_option_id` (`product_option_id`);
ALTER TABLE `oc_product_option_value` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_option_value` ADD INDEX `option_id` (`option_id`);
ALTER TABLE `oc_product_option_value` ADD INDEX `option_value_id` (`option_value_id`);
ALTER TABLE `oc_product_option_value` ADD INDEX `subtract` (`subtract`);
ALTER TABLE `oc_product_option_value` ADD INDEX `quantity` (`quantity`);

ALTER TABLE `oc_product_recurring` ADD INDEX `recurring_id` (`recurring_id`);
ALTER TABLE `oc_product_recurring` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_product_related` ADD INDEX `related_id` (`related_id`);

ALTER TABLE `oc_product_reward` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_reward` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_product_special` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_product_special` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_product_to_category` ADD INDEX `category_id` (`category_id`);

ALTER TABLE `oc_product_to_download` ADD INDEX `download_id` (`download_id`);

ALTER TABLE `oc_product_to_layout` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_product_to_layout` ADD INDEX `layout_id` (`layout_id`);

ALTER TABLE `oc_product_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_product_wishlist` ADD INDEX product_id (`product_id`);

ALTER TABLE `oc_recurring` ADD INDEX `status` (`status`);
ALTER TABLE `oc_recurring` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_recurring_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_recurring_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_return` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_return` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_return` ADD INDEX `customer_id` (`customer_id`);

ALTER TABLE `oc_return_action` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_return_action` ADD INDEX `name` (`name`);

ALTER TABLE `oc_return_history` ADD INDEX `return_id` (`return_id`);
ALTER TABLE `oc_return_history` ADD INDEX `return_status_id` (`return_status_id`);

ALTER TABLE `oc_return_reason` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_return_reason` ADD INDEX `name` (`name`);

ALTER TABLE `oc_return_status` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_return_status` ADD INDEX `name` (`name`);

ALTER TABLE `oc_review` ADD INDEX `product_id` (`product_id`);
ALTER TABLE `oc_review` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_review` ADD INDEX `status` (`status`);

ALTER TABLE `oc_setting` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_setting` ADD INDEX `group` (`group`);
ALTER TABLE `oc_setting` ADD INDEX `key` (`key`);
ALTER TABLE `oc_setting` ADD INDEX `serialized` (`serialized`);

ALTER TABLE `oc_stock_status` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_stock_status` ADD INDEX `name` (`name`);

ALTER TABLE `oc_tax_rate` ADD INDEX `geo_zone_id` (`geo_zone_id`);

ALTER TABLE `oc_tax_rate_to_customer_group` ADD INDEX `customer_group_id` (`customer_group_id`);

ALTER TABLE `oc_tax_rule` ADD INDEX `tax_class_id` (`tax_class_id`);
ALTER TABLE `oc_tax_rule` ADD INDEX `tax_rate_id` (`tax_rate_id`);

ALTER TABLE `oc_theme` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_translation` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_translation` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_translation` ADD INDEX `route` (`route`);
ALTER TABLE `oc_translation` ADD INDEX `key` (`key`);

ALTER TABLE `oc_user` ADD INDEX `user_group_id` (`user_group_id`);
ALTER TABLE `oc_user` ADD INDEX `status` (`status`);

ALTER TABLE `oc_url_alias` ADD INDEX `query` (`query`);
ALTER TABLE `oc_url_alias` ADD INDEX `keyword` (`keyword`);

ALTER TABLE `oc_seo_url` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_seo_url` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_seo_url` ADD INDEX `query` (`query`);
ALTER TABLE `oc_seo_url` ADD INDEX `keyword` (`keyword`);

ALTER TABLE `oc_voucher` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `oc_voucher` ADD INDEX `code` (`code`);
ALTER TABLE `oc_voucher` ADD INDEX `status` (`status`);

ALTER TABLE `oc_voucher_history` ADD INDEX `voucher_id` (`voucher_id`);
ALTER TABLE `oc_voucher_history` ADD INDEX `order_id` (`order_id`);

ALTER TABLE `oc_voucher_theme_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_voucher_theme_description` ADD INDEX `name` (`name`);

ALTER TABLE `oc_weight_class_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_weight_class_description` ADD INDEX `title` (`title`);

ALTER TABLE `oc_zone` ADD INDEX `country_id` (`country_id`);
ALTER TABLE `oc_zone` ADD INDEX `code` (`code`);
ALTER TABLE `oc_zone` ADD INDEX `status` (`status`);

ALTER TABLE `oc_zone_to_geo_zone` ADD INDEX `country_id` (`country_id`);
ALTER TABLE `oc_zone_to_geo_zone` ADD INDEX `zone_id` (`zone_id`);
ALTER TABLE `oc_zone_to_geo_zone` ADD INDEX `geo_zone_id` (`geo_zone_id`);

ALTER TABLE `oc_bm_category` ADD INDEX `parent_id` (`parent_id`);
ALTER TABLE `oc_bm_category` ADD INDEX `status` (`status`);
ALTER TABLE `oc_bm_category` ADD INDEX `sort_order` (`sort_order`);

ALTER TABLE `oc_bm_category_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_bm_category_description` ADD INDEX `title` (`title`);

ALTER TABLE `oc_bm_category_path` ADD INDEX `path_id` (`path_id`);
ALTER TABLE `oc_bm_category_path` ADD INDEX `level` (`level`);

ALTER TABLE `oc_bm_category_to_layout` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_bm_category_to_layout` ADD INDEX `layout_id` (`layout_id`);

ALTER TABLE `oc_bm_category_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_bm_post` ADD INDEX `user_id` (`user_id`);
ALTER TABLE `oc_bm_post` ADD INDEX `status` (`status`);

ALTER TABLE `oc_bm_post_description` ADD INDEX `post_id` (`language_id`);
ALTER TABLE `oc_bm_post_description` ADD INDEX `language_id` (`language_id`);
ALTER TABLE `oc_bm_post_description` ADD INDEX `title` (`title`);

ALTER TABLE `oc_bm_post_to_category` ADD INDEX `category_id` (`category_id`);

ALTER TABLE `oc_bm_post_to_layout` ADD INDEX `store_id` (`store_id`);
ALTER TABLE `oc_bm_post_to_layout` ADD INDEX `layout_id` (`layout_id`);

ALTER TABLE `oc_bm_post_to_store` ADD INDEX `store_id` (`store_id`);

ALTER TABLE `oc_bm_review` ADD INDEX `post_id` (`post_id`);
ALTER TABLE `oc_bm_review` ADD INDEX `reply_to_review_id` (`reply_to_review_id`);
ALTER TABLE `oc_bm_review` ADD INDEX `customer_id` (`customer_id`);
ALTER TABLE `oc_bm_review` ADD INDEX `language_id` (`language_id`);
