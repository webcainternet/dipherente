<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-copu" formaction="<?php echo $action; ?>" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <button type="submit" form="form-copu" formaction="<?php echo $action_exit; ?>" data-toggle="tooltip" title="<?php echo $button_save_exit; ?>" class="btn btn-primary"><i class="fa fa-floppy-o"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $common_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-copu" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-customer" data-toggle="tab"><?php echo $tab_customer; ?></a></li>
            <li><a href="#tab-order" data-toggle="tab"><?php echo $tab_order; ?></a></li>
            <li><a href="#tab-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
            <li><a href="#tab-filetype" data-toggle="tab"><?php echo $tab_filetype; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-customer">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="copu_customer_status" id="input-customer-status" class="form-control">
                    <option value="1"<?php if ($copu_customer_status) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                    <option value="0"<?php if (!$copu_customer_status) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_register; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_register" value="1"<?php if ($copu_customer_register) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_register" value="0"<?php if (!$copu_customer_register) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_email_alert; ?>"><?php echo $entry_email_alert; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_email_alert" value="1"<?php if ($copu_customer_email_alert) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>                
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_email_alert" value="0"<?php if (!$copu_customer_email_alert) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_drag_drop; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_drag_drop" value="1"<?php if ($copu_customer_drag_drop) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_drag_drop" value="0"<?php if (!$copu_customer_drag_drop) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_multiple; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_multiple" value="1"<?php if ($copu_customer_multiple) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_multiple" value="0"<?php if (!$copu_customer_multiple) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-limit"><?php echo $entry_limit; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_customer_limit" value="<?php echo $copu_customer_limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-customer-limit" class="form-control" />
                  <?php if ($error_customer_limit) { ?>
                  <div class="text-danger"><?php echo $error_customer_limit; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-minimum"><?php echo $entry_minimum; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_customer_minimum" value="<?php echo $copu_customer_minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-customer-minimum" class="form-control" />
                  <?php if ($error_customer_minimum) { ?>
                  <div class="text-danger"><?php echo $error_customer_minimum; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-files-per-page"><?php echo $entry_files_per_page; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_customer_files_per_page" value="<?php echo $copu_customer_files_per_page; ?>" placeholder="<?php echo $entry_files_per_page; ?>" id="input-customer-files-per-page" class="form-control" />
                  <?php if ($error_customer_files_per_page) { ?>
                  <div class="text-danger"><?php echo $error_customer_files_per_page; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-max-filesize"><span data-toggle="tooltip" title="<?php echo $help_max_filesize; ?>"><?php echo $entry_max_filesize; ?></span></label>
                <div class="col-sm-10">
                  <select name="copu_customer_max_filesize" id="input-customer-max-filesize" class="form-control">
                    <?php foreach($filesizes as $kb => $filesize) { ?>
                    <option value="<?php echo $kb; ?>"<?php if(isset($copu_customer_max_filesize) && $copu_customer_max_filesize == $kb) { ?> selected="selected"<?php } ?>><?php echo $filesize; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_max_dimension; ?>"><?php echo $entry_max_dimension; ?></span></label>
                <div class="col-sm-5">
                  <input type="text" name="copu_customer_max_dimension_w" value="<?php echo $copu_customer_max_dimension_w; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                </div>
                <div class="col-sm-5">
                  <input type="text" name="copu_customer_max_dimension_h" value="<?php echo $copu_customer_max_dimension_h; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-image-channel"><span data-toggle="tooltip" title="<?php echo $help_image_channel; ?>"><?php echo $entry_image_channel; ?></span></label>
                <div class="col-sm-10">
                  <select name="copu_customer_image_channel" id="input-customer-image-channel" class="form-control">
                    <option value="0"<?php if(isset($copu_customer_image_channel) && $copu_customer_image_channel == 0) { ?> selected="selected"<?php } ?>><?php echo $text_any; ?></option>
                    <option value="3"<?php if(isset($copu_customer_image_channel) && $copu_customer_image_channel == 3) { ?> selected="selected"<?php } ?>><?php echo $text_rgb; ?></option>
                    <option value="4"<?php if(isset($copu_customer_image_channel) && $copu_customer_image_channel == 4) { ?> selected="selected"<?php } ?>><?php echo $text_cmyk; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-max-filename-length"><span data-toggle="tooltip" title="<?php echo $help_max_filename_length; ?>"><?php echo $entry_max_filename_length; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_customer_max_filename_length" value="<?php echo $copu_customer_max_filename_length; ?>" placeholder="<?php echo $entry_max_filename_length; ?>" id="input-customer-max-filename-length" class="form-control" />
                  <?php if ($error_customer_max_filename_length) { ?>
                  <div class="text-danger"><?php echo $error_customer_max_filename_length; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-customer-file-location"><span data-toggle="tooltip" title="<?php echo $help_customer_file_location; ?>"><?php echo $entry_customer_file_location; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_customer_file_location" value="<?php echo $copu_customer_file_location; ?>" placeholder="<?php echo $entry_customer_file_location; ?>" id="input-customer-file-location" class="form-control" />
                  <?php if ($error_customer_file_location) { ?>
                  <div class="text-danger"><?php echo $error_customer_file_location; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_email_attachment; ?>"><?php echo $entry_customer_email_attachment; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_email_attachment" value="1"<?php if ($copu_customer_email_attachment) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_email_attachment" value="0"<?php if (!$copu_customer_email_attachment) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs">
                    <?php $first = true; ?>
                    <?php foreach ($languages as $language) { ?>
                      <li<?php if($first) { ?> class="active"<?php $first = false; } ?>><a href="#tab-customer-languages<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php $first = true; ?>
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane<?php if($first) { ?> active<?php $first = false; } ?>" id="tab-customer-languages<?php echo $language['language_id']; ?>">
                    <textarea name="copu_customer_message[<?php echo $language['language_id']; ?>][message]" id="customer-message<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_message; ?>" class="form-control"><?php echo isset($copu_customer_message[$language['language_id']]) ? $copu_customer_message[$language['language_id']]['message'] : ''; ?></textarea>
                  </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_preview; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_preview" value="1"<?php if ($copu_customer_preview) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_preview" value="0"<?php if (!$copu_customer_preview) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_preview_dimension; ?></label>
                <div class="col-sm-5">
                  <input type="text" name="copu_customer_preview_dimension_w" value="<?php echo $copu_customer_preview_dimension_w; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                </div>
                <div class="col-sm-5">
                  <input type="text" name="copu_customer_preview_dimension_h" value="<?php echo $copu_customer_preview_dimension_h; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_filetype; ?></label>
                <div class="col-sm-10">
                  <div id="customer-filetype" class="well well-sm" style="height: 250px; overflow: auto;">
                  <?php if($filetypes) { ?>
                    <?php foreach ($filetypes as $filetype) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_customer_filetypes[]" value="<?php echo $filetype['filetype_id']; ?>"<?php if (!empty($copu_customer_filetypes) && in_array($filetype['filetype_id'], $copu_customer_filetypes)) { ?> checked="checked"<?php } ?> id="customer-filetype-cbk<?php echo $filetype['filetype_id']; ?>" />
                        <?php echo $filetype['ext']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  <?php } ?>
                  </div>
                  <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_login; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_login" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_customer_login" value="0" disabled="disabled" />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
                <div class="col-sm-10">
                  <div id="customer-customer-group" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_customer_customer_groups[]" value="<?php echo $customer_group['customer_group_id']; ?>"<?php if (!empty($copu_customer_customer_groups) && in_array($customer_group['customer_group_id'], $copu_customer_customer_groups)) { ?> checked="checked"<?php } ?> id="customer_customer_group<?php echo $customer_group['customer_group_id']; ?>" />
                        <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div id="customer-store" class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_customer_stores[]" value="0"<?php if (!empty($copu_customer_stores) && in_array('0', $copu_customer_stores)) { ?> checked="checked"<?php } ?> id="customer_store0" />
                        <?php echo $text_default; ?>
                      </label>
                    </div>
                  <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_customer_stores[]" value="<?php echo $store['store_id']; ?>"<?php if (!empty($copu_customer_stores) && in_array($store['store_id'], $copu_customer_stores)) { ?> checked="checked"<?php } ?> id="customer_store<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                      </label>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-order">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="copu_order_status" id="input-order-status" class="form-control">
                    <option value="1"<?php if ($copu_order_status) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                    <option value="0"<?php if (!$copu_order_status) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_history_modify; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_history_modify" value="1"<?php if ($copu_order_history_modify) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_history_modify" value="0"<?php if (!$copu_order_history_modify) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-history-modify-status"><?php echo $entry_history_modify_status; ?></label>
                <div class="col-sm-10">
                  <select name="copu_order_history_modify_status" id="input-order-history-modify-status" class="form-control">
                    <option value="0"<?php if ($copu_order_history_modify_status == 0) { ?> selected="selected"<?php } ?>><?php echo $text_none; ?></option>
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"<?php if ($order_status['order_status_id'] == $copu_order_history_modify_status) { ?> selected="selected"<?php } ?>><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_history_modify_email_alert; ?>"><?php echo $entry_history_modify_email_alert; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_history_modify_email_alert" value="1"<?php if ($copu_order_history_modify_email_alert) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_history_modify_email_alert" value="0"<?php if (!$copu_order_history_modify_email_alert) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_drag_drop; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_drag_drop" value="1"<?php if ($copu_order_drag_drop) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_drag_drop" value="0"<?php if (!$copu_order_drag_drop) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_multiple; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_multiple" value="1"<?php if ($copu_order_multiple) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_multiple" value="0"<?php if (!$copu_order_multiple) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-limit"><?php echo $entry_limit; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_order_limit" value="<?php echo $copu_order_limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-order-limit" class="form-control" />
                  <?php if ($error_order_limit) { ?>
                  <div class="text-danger"><?php echo $error_order_limit; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-minimum"><?php echo $entry_minimum; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_order_minimum" value="<?php echo $copu_order_minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-order-minimum" class="form-control" />
                  <?php if ($error_order_minimum) { ?>
                  <div class="text-danger"><?php echo $error_order_minimum; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-max-filesize"><span data-toggle="tooltip" title="<?php echo $help_max_filesize; ?>"><?php echo $entry_max_filesize; ?></span></label>
                <div class="col-sm-10">
                  <select name="copu_order_max_filesize" id="input-order-max-filesize" class="form-control">
                    <?php foreach($filesizes as $kb => $filesize) { ?>
                    <option value="<?php echo $kb; ?>"<?php if(isset($copu_order_max_filesize) && $copu_order_max_filesize == $kb) { ?> selected="selected"<?php } ?>><?php echo $filesize; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_max_dimension; ?>"><?php echo $entry_max_dimension; ?></span></label>
                <div class="col-sm-5">
                  <input type="text" name="copu_order_max_dimension_w" value="<?php echo $copu_order_max_dimension_w; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                </div>
                <div class="col-sm-5">
                  <input type="text" name="copu_order_max_dimension_h" value="<?php echo $copu_order_max_dimension_h; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-image-channel"><span data-toggle="tooltip" title="<?php echo $help_image_channel; ?>"><?php echo $entry_image_channel; ?></span></label>
                <div class="col-sm-10">
                  <select name="copu_order_image_channel" id="input-order-image-channel" class="form-control">
                    <option value="0"<?php if(isset($copu_order_image_channel) && $copu_order_image_channel == 0) { ?> selected="selected"<?php } ?>><?php echo $text_any; ?></option>
                    <option value="3"<?php if(isset($copu_order_image_channel) && $copu_order_image_channel == 3) { ?> selected="selected"<?php } ?>><?php echo $text_rgb; ?></option>
                    <option value="4"<?php if(isset($copu_order_image_channel) && $copu_order_image_channel == 4) { ?> selected="selected"<?php } ?>><?php echo $text_cmyk; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-max-filename-length"><span data-toggle="tooltip" title="<?php echo $help_max_filename_length; ?>"><?php echo $entry_max_filename_length; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_order_max_filename_length" value="<?php echo $copu_order_max_filename_length; ?>" placeholder="<?php echo $entry_max_filename_length; ?>" id="input-order-max-filename-length" class="form-control" />
                  <?php if ($error_order_max_filename_length) { ?>
                  <div class="text-danger"><?php echo $error_order_max_filename_length; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-order-file-location"><span data-toggle="tooltip" title="<?php echo $help_order_file_location; ?>"><?php echo $entry_order_file_location; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="copu_order_file_location" value="<?php echo $copu_order_file_location; ?>" placeholder="<?php echo $entry_order_file_location; ?>" id="input-order-file-location" class="form-control" />
                  <?php if ($error_order_file_location) { ?>
                  <div class="text-danger"><?php echo $error_order_file_location; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_order_email_attachment; ?>"><?php echo $entry_order_email_attachment; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_email_attachment" value="1"<?php if ($copu_order_email_attachment) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_email_attachment" value="0"<?php if (!$copu_order_email_attachment) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>
                <div class="col-sm-10">
                  <ul class="nav nav-tabs">
                    <?php $first = true; ?>
                    <?php foreach ($languages as $language) { ?>
                      <li<?php if($first) { ?> class="active"<?php $first = false; } ?>><a href="#tab-order-languages<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <div class="tab-content">
                  <?php $first = true; ?>
                  <?php foreach ($languages as $language) { ?>
                  <div class="tab-pane<?php if($first) { ?> active<?php $first = false; } ?>" id="tab-order-languages<?php echo $language['language_id']; ?>">
                  <textarea name="copu_order_message[<?php echo $language['language_id']; ?>][message]" id="order-message<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_message; ?>" class="form-control"><?php echo isset($copu_order_message[$language['language_id']]) ? $copu_order_message[$language['language_id']]['message'] : ''; ?></textarea>
                  </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_preview; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_preview" value="1"<?php if ($copu_order_preview) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="copu_order_preview" value="0"<?php if (!$copu_order_preview) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_preview_dimension; ?></label>
                <div class="col-sm-5">
                  <input type="text" name="copu_order_preview_dimension_w" value="<?php echo $copu_order_preview_dimension_w; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                </div>
                <div class="col-sm-5">
                  <input type="text" name="copu_order_preview_dimension_h" value="<?php echo $copu_order_preview_dimension_h; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_filetype; ?></label>
                <div class="col-sm-10">
                  <div id="order-filetype" class="well well-sm" style="height: 250px; overflow: auto;">
                  <?php if($filetypes) { ?>
                    <?php foreach ($filetypes as $filetype) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_order_filetypes[]" value="<?php echo $filetype['filetype_id']; ?>"<?php if (!empty($copu_order_filetypes) && in_array($filetype['filetype_id'], $copu_order_filetypes)) { ?> checked="checked"<?php } ?> id="order-filetype-cbk<?php echo $filetype['filetype_id']; ?>" />
                        <?php echo $filetype['ext']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  <?php } ?>
                  </div>
                  <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_login; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <input type="radio" id="order_login1" name="copu_order_login" value="1"<?php if ($copu_order_login) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_yes; ?>
                  </label>
                  <label class="radio-inline">
                    <input type="radio" id="order_login0" name="copu_order_login" value="0"<?php if (!$copu_order_login) { ?> checked="checked"<?php } ?> />
                    <?php echo $text_no; ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
                <div class="col-sm-10">
                  <div id="order-customer-group" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_order_customer_groups[]" value="<?php echo $customer_group['customer_group_id']; ?>"<?php if (!empty($copu_order_customer_groups) && in_array($customer_group['customer_group_id'], $copu_order_customer_groups)) { ?> checked="checked"<?php } ?> id="order_customer_group<?php echo $customer_group['customer_group_id']; ?>" />
                        <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div id="order-store" class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_order_stores[]" value="0"<?php if (!empty($copu_order_stores) && in_array('0', $copu_order_stores)) { ?> checked="checked"<?php } ?> id="order_store0" />
                        <?php echo $text_default; ?>
                      </label>
                    </div>
                  <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="copu_order_stores[]" value="<?php echo $store['store_id']; ?>"<?php if (!empty($copu_order_stores) && in_array($store['store_id'], $copu_order_stores)) { ?> checked="checked"<?php } ?> id="order_store<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                      </label>
                    </div>
                  <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-product">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="tab-copu-product">
                  <?php $copu_product_row = 1; ?>
                  <?php foreach ($copu_products as $copu_product) { ?>
                    <li<?php if($copu_product_row == 1) { ?> class="active"<?php } ?>><a href="#tab-copu-product<?php echo $copu_product_row; ?>" id="copu-product<?php echo $copu_product_row; ?>" data-toggle="tab">
                    <i class="fa fa-minus-circle" onclick="$('#copu-product<?php echo $copu_product_row; ?>').remove(); $('#tab-copu-product<?php echo $copu_product_row; ?>').remove(); $('#tab-copu-product a:first').tab('show');"></i> <?php echo $tab_copu_product; ?> <?php echo $copu_product_row; ?></a></li>
                    <?php $copu_product_row++; ?>
                    <?php } ?>
                    <li id="copu-product-add"><a onclick="addCopuProduct();"><i class="fa fa-plus-circle"></i> <?php echo $button_add_copu_product; ?></a></li>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content" id="copu-product-tab-content">
                    <?php $copu_product_row = 1; ?>
                    <?php foreach ($copu_products as $copu_product) { ?>
                    <div class="tab-pane<?php if($copu_product_row == 1) { ?> active<?php } ?>" id="tab-copu-product<?php echo $copu_product_row; ?>">
                      <input type="hidden" name="copu_products[<?php echo $copu_product_row; ?>][copu_product_id]" value="<?php echo $copu_product['copu_product_id']; ?>" />
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-product<?php echo $copu_product_row; ?>-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                          <select name="copu_products[<?php echo $copu_product_row; ?>][status]" id="input-product<?php echo $copu_product_row; ?>-status" class="form-control">
                            <option value="1"<?php if ($copu_product['status']) { ?> selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                            <option value="0"<?php if (!$copu_product['status']) { ?> selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_drag_drop; ?></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][drag_drop]" value="1"<?php if ($copu_product['drag_drop']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][drag_drop]" value="0"<?php if (!$copu_product['drag_drop']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_multiple; ?></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][multiple]" value="1"<?php if ($copu_product['multiple']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][multiple]" value="0"<?php if (!$copu_product['multiple']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="copu-product<?php echo $copu_product_row; ?>-limit"><?php echo $entry_limit; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][limit]" value="<?php echo $copu_product['limit']; ?>" placeholder="<?php echo $entry_limit; ?>" id="copu-product<?php echo $copu_product_row; ?>-limit" class="form-control" />
                          <?php if ($error_copu_products && isset($error_copu_products[$copu_product['copu_product_id']]['limit'])) { ?>
                          <div class="text-danger"><?php echo $error_copu_products[$copu_product['copu_product_id']]['limit']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="copu-product<?php echo $copu_product_row; ?>-minimum"><?php echo $entry_minimum; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][minimum]" value="<?php echo $copu_product['minimum']; ?>" placeholder="<?php echo $entry_minimum; ?>" id="copu-product<?php echo $copu_product_row; ?>-minimum" class="form-control" />
                          <?php if ($error_copu_products && isset($error_copu_products[$copu_product['copu_product_id']]['minimum'])) { ?>
                          <div class="text-danger"><?php echo $error_copu_products[$copu_product['copu_product_id']]['minimum']; ?></span>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_force_qty; ?>"><?php echo $entry_force_qty; ?></span></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][force_qty]" value="1"<?php if ($copu_product['force_qty']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][force_qty]" value="0"<?php if (!$copu_product['force_qty']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="copu-product<?php echo $copu_product_row; ?>-max-filesize"><span data-toggle="tooltip" title="<?php echo $help_max_filesize; ?>"><?php echo $entry_max_filesize; ?></span></label>
                        <div class="col-sm-10">
                          <select name="copu_products[<?php echo $copu_product_row; ?>][max_filesize]" id="copu-product<?php echo $copu_product_row; ?>-max-filesize" class="form-control">
                            <?php foreach($filesizes as $kb => $filesize) { ?>
                            <option value="<?php echo $kb; ?>"<?php if(isset($copu_product['max_filesize']) && $copu_product['max_filesize'] == $kb) { ?> selected="selected"<?php } ?>><?php echo $filesize; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_max_dimension; ?>"><?php echo $entry_max_dimension; ?></span></label>
                        <div class="col-sm-5">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][max_dimension_w]" value="<?php echo $copu_product['max_dimension_w']; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                        </div>
                        <div class="col-sm-5">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][max_dimension_h]" value="<?php echo $copu_product['max_dimension_h']; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="copu-product<?php echo $copu_product_row; ?>-image-channel"><span data-toggle="tooltip" title="<?php echo $help_image_channel; ?>"><?php echo $entry_image_channel; ?></span></label>
                        <div class="col-sm-10">
                          <select name="copu_products[<?php echo $copu_product_row; ?>][image_channel]" id="copu-product<?php echo $copu_product_row; ?>-image-channel" class="form-control">
                            <option value="0"<?php if(isset($copu_product['image_channel']) && $copu_product['image_channel'] == 0) { ?> selected="selected"<?php } ?>><?php echo $text_any; ?></option>
                            <option value="3"<?php if(isset($copu_product['image_channel']) && $copu_product['image_channel'] == 3) { ?> selected="selected"<?php } ?>><?php echo $text_rgb; ?></option>
                            <option value="4"<?php if(isset($copu_product['image_channel']) && $copu_product['image_channel'] == 4) { ?> selected="selected"<?php } ?>><?php echo $text_cmyk; ?></option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="copu-product<?php echo $copu_product_row; ?>-max-filename-length"><span data-toggle="tooltip" title="<?php echo $help_max_filename_length; ?>"><?php echo $entry_max_filename_length; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][max_filename_length]" value="<?php echo $copu_product['max_filename_length']; ?>" placeholder="<?php echo $entry_max_filename_length; ?>" id="copu-product<?php echo $copu_product_row; ?>-max-filename-length" class="form-control" />
                          <?php if ($error_copu_products && isset($error_copu_products[$copu_product['copu_product_id']]['max_filename_length'])) { ?>
                          <div class="text-danger"><?php echo $error_copu_products[$copu_product['copu_product_id']]['max_filename_length']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_file_location; ?>"><?php echo $entry_product_file_location; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][file_location]" value="<?php echo $copu_product['file_location']; ?>" placeholder="<?php echo $entry_product_file_location; ?>" id="copu-product<?php echo $copu_product_row; ?>-file-location" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_email_attachment; ?>"><?php echo $entry_product_email_attachment; ?></span></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][email_attachment]" value="1"<?php if ($copu_product['email_attachment']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][email_attachment]" value="0"<?php if (!$copu_product['email_attachment']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>
                        <div class="col-sm-10">
                          <ul class="nav nav-tabs">
                            <?php $first = true; ?>
                            <?php foreach ($languages as $language) { ?>
                            <li<?php if($first) { ?> class="active"<?php $first = false; } ?>><a href="#tab-copu-product<?php echo $copu_product_row; ?>-languages<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php $first = true; ?>
                            <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane<?php if($first) { ?> active<?php $first = false; } ?>" id="tab-copu-product<?php echo $copu_product_row; ?>-languages<?php echo $language['language_id']; ?>">
                            <textarea name="copu_products[<?php echo $copu_product_row; ?>][message][<?php echo $language['language_id']; ?>][message]" id="copu-product<?php echo $copu_product_row; ?>-message<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_message; ?>" class="form-control"><?php echo isset($copu_product['message'][$language['language_id']]) ? $copu_product['message'][$language['language_id']]['message'] : ''; ?></textarea>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_preview; ?></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][preview]" value="1"<?php if ($copu_product['preview']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][preview]" value="0"<?php if (!$copu_product['preview']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_preview_dimension; ?></label>
                        <div class="col-sm-5">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][preview_dimension_w]" value="<?php echo $copu_product['preview_dimension_w']; ?>" placeholder="<?php echo $text_width; ?>" class="form-control" />
                        </div>
                        <div class="col-sm-5">
                          <input type="text" name="copu_products[<?php echo $copu_product_row; ?>][preview_dimension_h]" value="<?php echo $copu_product['preview_dimension_h']; ?>" placeholder="<?php echo $text_height; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_replace; ?>"><?php echo $entry_replace; ?></span></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][replace]" value="1"<?php if ($copu_product['replace']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                          <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][replace]" value="0"<?php if (!$copu_product['replace']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_filetype; ?></label>
                        <div class="col-sm-10">
                          <div id="copu-product<?php echo $copu_product_row; ?>-filetype" class="well well-sm" style="height: 250px; overflow: auto;">
                          <?php if($filetypes) { ?>
                            <?php foreach ($filetypes as $filetype) { ?>
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="copu_products[<?php echo $copu_product_row; ?>][filetypes][]" value="<?php echo $filetype['filetype_id']; ?>"<?php if (!empty($copu_product['filetypes']) && in_array($filetype['filetype_id'], $copu_product['filetypes'])) { ?> checked="checked"<?php } ?> id="copu-product<?php echo $copu_product_row; ?>-filetype-cbk<?php echo $filetype['filetype_id']; ?>" />
                                <?php echo $filetype['ext']; ?>
                              </label>
                            </div>
                            <?php } ?>
                          <?php } ?>
                          </div>
                          <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_upload_option; ?></label>
                        <div class="col-sm-10">
                          <div id="copu-product<?php echo $copu_product_row; ?>-option" class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($copu_options as $copu_option) { ?>
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="copu_products[<?php echo $copu_product_row; ?>][options][]" value="<?php echo $copu_option['option_id']; ?>"<?php if (!empty($copu_product['options']) && in_array($copu_option['option_id'], $copu_product['options'])) { ?> checked="checked"<?php } ?> id="copu-product<?php echo $copu_product_row; ?>_option<?php echo $copu_option['option_id']; ?>" />
                                <?php echo $copu_option['name']; ?>
                              </label>
                            </div>
                            <?php } ?>
                          </div>
                          <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_login; ?></label>
                        <div class="col-sm-10">
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][login]" value="1"<?php if ($copu_product['login']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_yes; ?>
                          </label>
                          <label class="radio-inline">
                            <input type="radio" name="copu_products[<?php echo $copu_product_row; ?>][login]" value="0"<?php if (!$copu_product['login']) { ?> checked="checked"<?php } ?> />
                            <?php echo $text_no; ?>
                          </label>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>
                        <div class="col-sm-10">
                          <div id="product<?php echo $copu_product_row; ?>-customer-group" class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="copu_products[<?php echo $copu_product_row; ?>][customer_groups][]" value="<?php echo $customer_group['customer_group_id']; ?>"<?php if (!empty($copu_product['customer_groups']) && in_array($customer_group['customer_group_id'], $copu_product['customer_groups'])) { ?> checked="checked"<?php } ?> id="copu-product<?php echo $copu_product_row; ?>_customer_group<?php echo $customer_group['customer_group_id']; ?>" />
                                <?php echo $customer_group['name']; ?>
                              </label>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                        <div class="col-sm-10">
                          <div id="product<?php echo $copu_product_row; ?>-store" class="well well-sm" style="height: 150px; overflow: auto;">
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="copu_products[<?php echo $copu_product_row; ?>][stores][]" value="0"<?php if (!empty($copu_product['stores']) && in_array('0', $copu_product['stores'])) { ?> checked="checked"<?php } ?> id="copu-product<?php echo $copu_product_row; ?>_store0" />
                                <?php echo $text_default; ?>
                              </label>
                            </div>
                          <?php foreach ($stores as $store) { ?>
                            <div class="checkbox">
                              <label>
                                <input type="checkbox" name="copu_products[<?php echo $copu_product_row; ?>][stores][]" value="<?php echo $store['store_id']; ?>"<?php if (!empty($copu_product['stores']) && in_array($store['store_id'], $copu_product['stores'])) { ?> checked="checked"<?php } ?> id="copu-product<?php echo $copu_product_row; ?>_store<?php echo $store['store_id']; ?>" />
                                <?php echo $store['name']; ?>
                              </label>
                            </div>
                          <?php } ?>
                          </div>
                        </div>
                      </div>
                    </div>
                    <?php $copu_product_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-filetype">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="filetype-tbl">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $column_ext; ?></td>
                      <td class="text-left"><?php echo $column_mime; ?></td>
                      <td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($filetypes) { ?>
                    <?php foreach ($filetypes as $filetype) { ?>
                    <tr id="filetype<?php echo $filetype['filetype_id']; ?>">
                      <td class="text-left ext"><?php echo $filetype['ext']; ?></td>
                      <td class="text-left"><?php echo $filetype['mime']; ?></td>
                      <td class="text-right">
                        <button type="button" onclick="deleteFileType(event, <?php echo $filetype['filetype_id']; ?>, '<?php echo $filetype['delete']; ?>');" data-toggle="tooltip" data-loading-text="<?php echo $text_loading; ?>" title="<?php echo $text_delete; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                      </td>
                    </tr>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                    <tr>
                      <td class="text-left"><?php echo $entry_ext; ?><input type="text" id="new-ext" value="" placeholder="<?php echo $help_ext; ?>" class="form-control" /></td>
                      <td class="text-left"><?php echo $entry_mime; ?><input type="text" id="new-mime" value="" placeholder="<?php echo $help_mime; ?>" class="form-control" /></td>
                      <td class="text-right">
                        <button type="button" onclick="addFileType(event);" data-toggle="tooltip" title="<?php echo $button_add_filetype; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-12"><?php echo $myoc_copyright; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#customer-message<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#order-message<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php $copu_product_row = 1; ?>
<?php foreach ($copu_products as $copu_product) { ?>
$('#copu-product<?php echo $copu_product_row; ?>-message<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php $copu_product_row++; ?>
<?php } ?>
<?php } ?>

var filetypes = new Array();
<?php if($filetypes) { ?>
  <?php $i = 0; ?>
  <?php foreach($filetypes as $filetype) { ?>
  filetypes[<?php echo $i; ?>] = {'filetype_id':<?php echo $filetype['filetype_id']; ?>, 'ext':'<?php echo $filetype['ext']; ?>'};
    <?php $i++; ?>
  <?php } ?>
<?php } ?>

<?php $total_copu_product_row = count($copu_products); ?>
var copu_product_row = <?php echo ($total_copu_product_row + 1); ?>;

function deleteFileType(e, _filetype_id, _url) {
  var _target = (e.target) ? e.target : e.srcElement;
  if(confirm('<?php echo $text_confirm_delete; ?> \'' + $('#filetype' + _filetype_id + ' td.ext').html() + '\'?')) {
    $.ajax({
      url: _url,
      dataType: 'json',
      beforeSend: function() {
        $(_target).button('loading');
        $('.alert').remove();
      },
      complete: function() {
        $(_target).button('reset');
      },      
      success: function(json) {
        if(json['success']) {
          if(filetypes.length > 0) {
            for(var i = 0; i < filetypes.length; i++) {
              if(filetypes.hasOwnProperty(i) && filetypes[i].filetype_id == _filetype_id) {
                delete filetypes[i];
                break;
              }
            }
          }
          $('#filetype' + _filetype_id).fadeOut(function() { $(this).remove(); });
          $('#customer-filetype-cbk' + _filetype_id).parent().parent().remove();
          $('#order-filetype-cbk' + _filetype_id).parent().parent().remove();
          for(var i = 1; i < copu_product_row; i++) {
            $('#copu-product' + i + '-filetype-cbk' + _filetype_id).parent().parent().remove();
          }
        }
        if(json['error']) {
          $('#tab-filetype').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  }
  return false;
}

function addFileType(e) {
  var _target = (e.target) ? e.target : e.srcElement;
  var _this = $(_target);
  var ext = $("#new-ext").val().replace(/ /g, '');
  var mime = $("#new-mime").val().replace(/ /g, '');
  if(ext == "") {
    return false;
  } else {
    $.ajax({
      url: 'index.php?route=module/myoccopu/insert&token=<?php echo $token; ?>&ext=' + ext + '&mime=' + mime,
      dataType: 'json',
      beforeSend: function() {
        $(_target).button('loading');
        $('.alert').remove();
      },
      complete: function() {
        $(_target).button('reset');
      },      
      success: function(json) {
        if(json['success']) {
          filetypes.push({'filetype_id':json['filetype']['filetype_id'], 'ext':json['filetype']['ext']});
          var newFiletypeRow = '<tr id="filetype' + json['filetype']['filetype_id'] + '"><td class="text-left ext">' + json['filetype']['ext'] + '</td><td class="text-left">' + json['filetype']['mime'] + '</td><td class="text-right"><button type="button" onclick="deleteFileType(event, ' + json['filetype']['filetype_id'] + ', \'index.php?route=module/myoccopu/delete&filetype_id=' + json['filetype']['filetype_id'] + '&token=<?php echo $token; ?>\');" data-toggle="tooltip" data-loading-text="<?php echo $text_loading; ?>" title="<?php echo $text_delete; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td></tr>';
          $('#filetype-tbl tbody > tr:last').before(newFiletypeRow);

          $('#customer-filetype').append('<div class="checkbox"><label><input type="checkbox" name="copu_customer_filetypes[]" value="' + json['filetype']['filetype_id'] + '" id="customer-filetype-cbk' + json['filetype']['filetype_id'] + '" /> ' + json['filetype']['ext'] + '</lable></div>');

          $('#order-filetype').append('<div class="checkbox"><label><input type="checkbox" name="copu_order_filetypes[]" value="' + json['filetype']['filetype_id'] + '" id="order-filetype-cbk' + json['filetype']['filetype_id'] + '" /> ' + json['filetype']['ext'] + '</label></div>');

          for(var i = 1; i < copu_product_row; i++) {
            $('#copu-product' + i + '-filetype').append('<div class="checkbox"><label><input type="checkbox" name="copu_products[' + i + '][filetypes][]" value="' + json['filetype']['filetype_id'] + '" id="copu-product' + i + '-filetype-cbk' + json['filetype']['filetype_id'] + '" /> ' + json['filetype']['ext'] + '</label></div>');
          }
        }
        if(json['error']) {
          $('#tab-filetype').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  }
}

var new_copu_product_id = <?php echo $next_copu_product_id; ?>;
function addCopuProduct() {
  html  = '<div id="tab-copu-product' + copu_product_row + '" class="tab-pane">';
  html += '  <input type="hidden" name="copu_products[' + copu_product_row + '][copu_product_id]" value="' + new_copu_product_id + '" />';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="input-product' + copu_product_row + '-status"><?php echo $entry_status; ?></label>';
  html += '    <div class="col-sm-10"><select name="copu_products[' + copu_product_row + '][status]" id="input-product' + copu_product_row + '-status" class="form-control">';
  html += '        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '        <option value="0"><?php echo $text_disabled; ?></option>';
  html += '      </select></div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_drag_drop; ?></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][drag_drop]" value="1" checked="checked" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][drag_drop]" value="0" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_multiple; ?></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][multiple]" value="1" checked="checked" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][multiple]" value="0" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="copu-product' + copu_product_row + '-limit"><?php echo $entry_limit; ?></label>';
  html += '    <div class="col-sm-10"><input type="text" name="copu_products[' + copu_product_row + '][limit]" value="1" placeholder="<?php echo $entry_limit; ?>" id="copu-product' + copu_product_row + '-limit" class="form-control" />';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="copu-product' + copu_product_row + '-minimum"><?php echo $entry_minimum; ?></label>';
  html += '    <div class="col-sm-10"><input type="text" name="copu_products[' + copu_product_row + '][minimum]" value="1" placeholder="<?php echo $entry_minimum; ?>" id="copu-product' + copu_product_row + '-minimum" class="form-control" />';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_force_qty; ?>"><?php echo $entry_force_qty; ?></span></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][force_qty]" value="1" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" name="copu_products[' + copu_product_row + '][force_qty]" value="0" checked="checked" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="copu-product' + copu_product_row + '-max-filesize"><span data-toggle="tooltip" title="<?php echo $help_max_filesize; ?>"><?php echo $entry_max_filesize; ?></span></label>';
  html += '    <div class="col-sm-10"><select name="copu_products[' + copu_product_row + '][max_filesize]" id="copu-product' + copu_product_row + '-max-filesize" class="form-control">';
  <?php foreach($filesizes as $kb => $filesize) { ?>
  html += '        <option value="<?php echo $kb; ?>"<?php if($kb == 5242) { ?> selected="selected"<?php } ?>><?php echo $filesize; ?></option>';
  <?php } ?>
  html += '      </select></div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_max_dimension; ?>"><?php echo $entry_max_dimension; ?></span></label>';
  html += '    <div class="col-sm-5">';
  html += '      <input type="text" name="copu_products[' + copu_product_row + '][max_dimension_w]" value="0" placeholder="<?php echo $text_width; ?>" class="form-control" />';
  html += '    </div>';
  html += '    <div class="col-sm-5">';
  html += '      <input type="text" name="copu_products[' + copu_product_row + '][max_dimension_h]" value="0" placeholder="<?php echo $text_height; ?>" class="form-control" />';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="copu-product' + copu_product_row + '-image-channel"><span data-toggle="tooltip" title="<?php echo $help_image_channel; ?>"><?php echo $entry_image_channel; ?></span></label>';
  html += '    <div class="col-sm-10"><select name="copu_products[' + copu_product_row + '][image_channel]" id="copu-product' + copu_product_row + '-image-channel" class="form-control">';
  html += '        <option value="0" selected="selected"><?php echo $text_any; ?></option>';
  html += '        <option value="3"><?php echo $text_rgb; ?></option>';
  html += '        <option value="4"><?php echo $text_cmyk; ?></option>';
  html += '      </select></div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label" for="copu-product' + copu_product_row + '-max-filename-length"><span data-toggle="tooltip" title="<?php echo $help_max_filename_length; ?>"><?php echo $entry_max_filename_length; ?></span></label>';
  html += '    <div class="col-sm-10"><input type="text" name="copu_products[' + copu_product_row + '][max_filename_length]" value="20" placeholder="<?php echo $entry_max_filename_length; ?>" id="copu-product' + copu_product_row + '-max-filename-length" class="form-control" />';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_file_location; ?>"><?php echo $entry_product_file_location; ?></span></label>';
  html += '    <div class="col-sm-10"><input type="text" name="copu_products[' + copu_product_row + '][file_location]" value="upload" placeholder="<?php echo $entry_product_file_location; ?>" id="copu-product<?php echo $copu_product_row; ?>-file-location" class="form-control" /></div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_email_attachment; ?>"><?php echo $entry_product_email_attachment; ?></span></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_email_attachment1" name="copu_products[' + copu_product_row + '][email_attachment]" value="1" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_email_attachment0" name="copu_products[' + copu_product_row + '][email_attachment]" value="0" checked="checked" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>';
  html += '    <div class="col-sm-10">';
  html += '      <ul class="nav nav-tabs">';
  <?php $first = true; ?>
  <?php foreach ($languages as $language) { ?>
  html += '        <li<?php if($first) { ?> class="active"<?php $first = false; } ?>><a href="#tab-copu-product' + copu_product_row + '-languages<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo addslashes($language['name']); ?>" /> <?php echo addslashes($language['name']); ?></a></li>';
  <?php } ?>
  html += '      </ul>';
  html += '      <div class="tab-content">';
  <?php $first = true; ?>
  <?php foreach ($languages as $language) { ?>
  html += '        <div id="tab-copu-product' + copu_product_row + '-languages<?php echo $language['language_id']; ?>" class="tab-pane<?php if($first) { ?> active<?php $first = false; } ?>">';
  html += '          <textarea name="copu_products[' + copu_product_row + '][message][<?php echo $language['language_id']; ?>][message]" id="copu-product' + copu_product_row + '-message<?php echo $language['language_id']; ?>" placeholder="<?php echo $entry_message; ?>" class="form-control"></textarea></div>';
  <?php } ?>
  html += '      </div>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_preview; ?></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_preview1" name="copu_products[' + copu_product_row + '][preview]" value="1" checked="checked" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_preview0" name="copu_products[' + copu_product_row + '][preview]" value="0" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_preview_dimension; ?></label>';
  html += '    <div class="col-sm-5">';
  html += '      <input type="text" name="copu_products[' + copu_product_row + '][preview_dimension_w]" value="80" placeholder="<?php echo $text_width; ?>" class="form-control" />';
  html += '    </div>';
  html += '    <div class="col-sm-5">';
  html += '      <input type="text" name="copu_products[' + copu_product_row + '][preview_dimension_h]" value="80" placeholder="<?php echo $text_height; ?>" class="form-control" />';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_replace; ?>"><?php echo $entry_replace; ?></span></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_replace1" name="copu_products[' + copu_product_row + '][replace]" value="1" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_replace0" name="copu_products[' + copu_product_row + '][replace]" value="0" checked="checked" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_filetype; ?></label>';
  html += '    <div class="col-sm-10"><div id="copu-product' + copu_product_row + '-filetype" class="well well-sm" style="height: 250px; overflow: auto;">';
  if(filetypes.length > 0) {
    for(var i = 0; i < filetypes.length; i++) {
      if(filetypes.hasOwnProperty(i)) {
        var filetype_id = filetypes[i].filetype_id;
        var ext = filetypes[i].ext;
        html += '        <div class="checkbox">';
        html += '          <label>';
        html += '            <input type="checkbox" name="copu_products[' + copu_product_row + '][filetypes][]" value="' + filetype_id + '" id="copu-product' + copu_product_row + '-filetype-cbk' + filetype_id + '" /> ';
        html += ext + '    </label>';
        html += '        </div>';
      }
    }
  }
  html += '      </div>';
  html += '      <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_upload_option; ?></label>';
  html += '    <div class="col-sm-10"><div id="copu-product' + copu_product_row + '-option" class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($copu_options as $copu_option) { ?>
  html += '        <div class="checkbox">';
  html += '          <label>';
  html += '            <input type="checkbox" name="copu_products[' + copu_product_row + '][options][]" value="<?php echo $copu_option['option_id']; ?>" id="copu-product' + copu_product_row + '_option<?php echo $copu_option['option_id']; ?>" />';
  html += '            <?php echo addslashes($copu_option['name']); ?></label>';
  html += '        </div>';
  <?php } ?>
  html += '      </div>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_login; ?></label>';
  html += '    <div class="col-sm-10">';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_login1" name="copu_products[' + copu_product_row + '][login]" value="1" />';
  html += '        <?php echo $text_yes; ?></label>';
  html += '      <label class="radio-inline">';
  html += '        <input type="radio" id="copu-product' + copu_product_row + '_login0" name="copu_products[' + copu_product_row + '][login]" value="0" checked="checked" />';
  html += '        <?php echo $text_no; ?></label>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>';
  html += '    <div class="col-sm-10"><div id="product' + copu_product_row + '-customer-group" class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($customer_groups as $customer_group) { ?>
  html += '        <div class="checkbox">';
  html += '          <label>';
  html += '            <input type="checkbox" name="copu_products[' + copu_product_row + '][customer_groups][]" value="<?php echo $customer_group['customer_group_id']; ?>" id="copu-product' + copu_product_row + '_customer_group<?php echo $customer_group['customer_group_id']; ?>" />';
  html += '            <?php echo addslashes($customer_group['name']); ?></label>';
  html += '        </div>';
  <?php } ?>
  html += '      </div>';
  html += '    </div>';
  html += '  </div>';
  html += '  <div class="form-group">';
  html += '    <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>';
  html += '    <div class="col-sm-10"><div id="product' + copu_product_row + '-store" class="well well-sm" style="height: 150px; overflow: auto;">';
  html += '        <div class="checkbox">';
  html += '          <label>';
  html += '            <input type="checkbox" name="copu_products[' + copu_product_row + '][stores][]" value="0" checked="checked" id="copu-product' + copu_product_row + '_store0" />';
  html += '            <?php echo $text_default; ?></label>';
  html += '        </div>';
  <?php foreach ($stores as $store) { ?>
  html += '        <div class="checkbox">';
  html += '          <label>';
  html += '            <input type="checkbox" name="copu_products[' + copu_product_row + '][stores][]" value="<?php echo $store['store_id']; ?>" id="copu-product' + copu_product_row + '_store<?php echo $store['store_id']; ?>" />';
  html += '             <?php echo addslashes($store['name']); ?></label>';
  html += '        </div>';
  <?php } ?>
  html += '      </div>';
  html += '    </div>';
  html += '  </div>';
  html += '</div>';

  $('#copu-product-tab-content').append(html);

  $('#copu-product-add').before('<li><a href="#tab-copu-product' + copu_product_row + '" data-toggle="tab" id="copu-product' + copu_product_row + '"><i class="fa fa-minus-circle" onclick="$(\'#tab-copu-product a:first\').tab(\'show\'); $(\'#copu-product' + copu_product_row + '\').parent().remove(); $(\'#tab-copu-product' + copu_product_row + '\').remove();"></i> <?php echo $tab_copu_product; ?> ' + copu_product_row + '</a></li>');

  <?php foreach ($languages as $language) { ?>
  $('#copu-product' + copu_product_row + '-message<?php echo $language['language_id']; ?>').summernote({height: 300});
  <?php } ?>

  $('#tab-copu-product a[href=\'#tab-copu-product' + copu_product_row + '\']').tab('show');
  $('[data-toggle="tooltip"]').tooltip({
    container: 'body', 
    html: 'true'
  });
  
  copu_product_row++;
  new_copu_product_id++;
}
//--></script>
<?php echo $footer; ?>