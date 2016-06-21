<?php
// Heading
$_['heading_title']						= 'Customer Order Product Upload<span style="float:right;">[ <a href="http://opencart.my/" target="_blank">Opencart.my</a> ]</span>';
$_['common_title']						= 'Customer Order Product Upload';
	
// Text	
$_['text_form']    						= 'Edit Customer Order Product Upload';
$_['text_module']						= 'Modules';
$_['text_success']						= 'Success: You have modified Customer Order Product Upload module!';
$_['text_default']						= 'Default';
$_['text_upload']						= 'File Uploads';
$_['text_add_filetype']					= 'Add File Type';
$_['text_no_results']					= 'No filetype found!';
$_['text_delete']						= 'Delete';
$_['text_confirm_delete']				= 'Confirm delete';
$_['text_download']						= 'Download';
$_['text_popup']						= 'Preview';
$_['text_empty']						= 'Upload is empty.';
$_['text_drag_drop']    				= 'Drag Files &amp; Drop Here';
$_['text_loading']    					= 'Loading...';
$_['text_complete']    					= 'Complete!';
$_['text_any']    						= 'Any';
$_['text_rgb']    						= 'RGB';
$_['text_cmyk']    						= 'CMYK';
$_['text_width']    					= 'Width';
$_['text_height']    					= 'Height';
	
$_['button_save_exit']					= 'Save &amp; Exit';
$_['button_add_copu_product']			= 'Add Product Upload';
$_['button_add_filetype']				= 'Add';
$_['button_upload']						= 'Upload File';
		
$_['tab_customer']						= 'Customer';
$_['tab_order']							= 'Order';
$_['tab_product']						= 'Product';
$_['tab_copu_product']					= 'Upload';
$_['tab_filetype']						= 'File Types';
		
$_['entry_status']						= 'Status:';
$_['entry_register']					= 'Enable Upload in Registration:';
$_['entry_email_alert']					= 'Enable Email Alert:';
$_['entry_history_modify']				= 'Enable Upload in Customer Orders History:';
$_['entry_history_modify_status']		= 'Customer Order History Update Status:';
$_['entry_history_modify_email_alert']	= 'Enable Order History Upload Email Alert:';
$_['entry_drag_drop']					= 'Enable Drag &amp; Drop:';
$_['entry_multiple']					= 'Enable Multiple/Batch Files Upload:';
$_['entry_limit']						= 'Maximum Number of File Upload:';
$_['entry_minimum']						= 'Minimum Required Upload:';
$_['entry_files_per_page']				= 'Number of Files per Page:';
$_['entry_max_filesize']				= 'Maximum File Size:';
$_['entry_max_dimension']				= 'Maximum Image Dimension (W x H):';
$_['entry_image_channel']				= 'Image Color Channel:';
$_['entry_max_filename_length'] 		= 'Maximum Filename Cut-off Length:';
$_['entry_message']						= 'Upload Instruction:';
$_['entry_preview']						= 'Preview Uploaded Image:';
$_['entry_preview_dimension']			= 'Image Preview Dimension (W x H):';
$_['entry_filetype']					= 'Allowed File Type:';
$_['entry_replace']						= 'Replace Product Image:';
$_['entry_login']						= 'Login Required:';
$_['entry_customer_group']				= 'Customer Groups:';
$_['entry_store']						= 'Stores:';
$_['entry_ext']							= '<b>Extension:</b>';
$_['entry_mime']						= '<b>MIME:</b> <a href="http://filext.com" target="_blank">filext.com</a>';
$_['entry_upload_option']				= 'Product Options:';
$_['entry_force_qty']					= 'Force Quantity:';
$_['entry_customer_file_location']		= 'File Upload Folder:';
$_['entry_order_file_location']			= 'File Upload Folder:';
$_['entry_product_file_location']		= 'File Upload Folder:';
$_['entry_customer_email_attachment']	= 'Send Files as Email Attachments:';
$_['entry_order_email_attachment']		= 'Send Files as Email Attachments:';
$_['entry_product_email_attachment']	= 'Send Files as Email Attachments:';

$_['help_email_alert']					= 'Email address can be set under System &gt; Settings &gt; Your Store [Edit] &gt; General or Mail tab.';
$_['help_history_modify_email_alert']	= 'Email address can be set under System &gt; Settings &gt; Your Store [Edit] &gt; General or Mail tab.';
$_['help_max_filesize']					= 'Please check your server php.ini settings to allow large file size limit.';
$_['help_max_dimension']				= 'Only for image file types. Insert 0 x 0 for unrestricted dimension.';
$_['help_image_channel']				= 'Only for image file types';
$_['help_max_filename_length']			= 'Actual filename will not be shorten. Only for front-end display:<br />very...jpg instead of verylongfilename.jpg';
$_['help_message']						= 'Display a short text before the upload field.';
$_['help_replace']						= 'Only for image file types';
$_['help_ext']							= 'jpg, txt, psd';
$_['help_mime']							= 'leave blank to disable MIME check';
$_['help_force_qty']					= 'Force order quantity equals to number of files uploaded by customer.';
$_['help_customer_file_location']		= 'Sub-folder: upload/files<br />By customer ID: files/%customer_id%';
$_['help_order_file_location']			= 'Sub-folder: upload/files<br />By customer ID: files/%customer_id%<br />By order ID: image/%order_id%';
$_['help_product_file_location']		= 'Sub-folder: upload/files<br />By customer ID: files/%customer_id%<br />By order ID: image/%order_id%<br />By product ID: uploads/%product_id%';
$_['help_customer_email_attachment']	= 'Will be sent with New Account Alert Email';
$_['help_order_email_attachment']		= 'Will be sent with New Order Alert Email';
$_['help_product_email_attachment']		= 'Will be sent with New Order Alert Email';
//$_['help_']

$_['column_ext']						= 'Extension';
$_['column_mime']						= 'MIME';
$_['column_action']						= 'Action';
$_['column_image']						= 'Image';
$_['column_name']						= 'File Name';
$_['column_size']						= 'Size';
$_['column_date']						= 'Date Added';
	
// Error	
$_['error_permission']					= 'Warning: You do not have permission to modify Customer Order Product Upload module!';
$_['error_numeric']						= 'Please enter numbers only!';
$_['error_file_location']				= '%s is not allowed in %s file location!';
$_['error_submission']					= 'Warning: Please check the form carefully for errors!';
$_['error_delete']						= 'Delete failed. File not found!';
$_['error_filename']					= 'Filename must be between 3 and 64 characters!';
$_['error_upload']						= 'Upload required!';
	
$_['success_install']					= 'Success: You have installed Customer Order Product Upload module! Please click on [ <a href="%s">Edit</a> ] to setup the Upload settings.';
	
$_['myoc_copyright']					= '<p>Copyright &copy; 2012-2016 Opencart.my. All rights reserved.<br />Version 1.6.7</p>';
?>