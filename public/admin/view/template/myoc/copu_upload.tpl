<?php if($html) { ?>
<script type="text/javascript"><!--
$("#button-save").html('<i class="fa fa-arrow-right"></i> <?php echo $button_continue; ?>');
$("#button-save").attr("id", "button-total");
$('#button-total').on('click', function() {
  $('a[href=\'#tab-copu\']').tab('show');
});
//--></script>
<div id="tab-copu" class="tab-pane">
  <div class="table-responsive">
    <table id="copu-tbl" class="table table-bordered table-hover copu-tbl">
      <thead>
        <tr>
          <td class="text-center"><?php echo $column_image; ?></td>
          <td class="text-left"><?php echo $column_name; ?></td>
          <td class="text-right" style="width:10%;"><?php echo $column_size; ?></td>
          <td class="text-right" style="width:15%;"><?php echo $column_date; ?></td>
          <?php if($delete) { ?><td class="text-right" style="width:10%;"><?php echo $column_action; ?></td><?php } ?>
        </tr>
      </thead>
      <tbody>
        <?php if ($uploads) { ?>
        <?php foreach ($uploads as $file) { ?>
        <tr id="upload<?php echo $file['upload_id']; ?>">
          <?php if($upload) { ?><input type="hidden" name="<?php echo $type; ?>_upload[]" value="<?php echo $file['upload_id']; ?>" /><?php } ?>
          <td class="text-center"><?php if($file['popup']) { ?><a href="<?php echo $file['popup']; ?>" class="popup"><?php } ?><img src="<?php echo $file['image']; ?>" alt="<?php echo $file['name']; ?>" title="<?php echo $text_popup; ?>" /><?php if($file['popup']) { ?></a><?php } ?></td>
          <td class="text-left"><a href="<?php echo $file['href']; ?>" title="<?php echo $text_download; ?>"><?php echo $file['name']; ?></a></td>
          <td class="text-right"><?php echo $file['size']; ?></td>
          <td class="text-right"><?php echo $file['date']; ?></td>
          <?php if($delete) { ?><td class="text-right"><a onclick="deleteUpload(event, '<?php echo $file['upload_id']; ?>', '<?php echo $file['delete']; ?>');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-times"></i></a></td><?php } ?>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr class="empty">
          <td class="text-center" colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td>
        </tr>
        <?php } ?>
        <?php if($upload) { ?>
        <tr class="error-msg"></tr>
        <tr>
          <td colspan="<?php echo $colspan; ?>" class="upload-ctrl">
            <div class="drop-zone">
              <p class="bg-text"><?php echo $text_drag_drop; ?></p>
              <button type="button" id="copu-button-upload" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
            </div>
          </td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <?php if($type == 'order' && $upload) { ?>
  <div class="row">
    <div class="col-sm-6 text-left">
      <button type="button" onclick="$('a[href=\'#tab-total\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
    </div>
    <div class="col-sm-6 text-right">
      <button type="button" id="button-save" class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
    </div>
  </div>
  <?php } ?>
</div>
<?php } ?>
<?php if($javascript) { ?>
<script type="text/javascript"><!--
$('.popup').magnificPopup({
  type: 'image',
  closeOnContentClick: true  
});
<?php if($delete) { ?>
var empty_row = '<tr class="empty"><td class="text-center" colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td></tr>';
function deleteUpload(e, _upload_id, _url) {
  var _target = (e.target) ? e.target : e.srcElement;
  var _thisUploadTbody = $("#upload" + _upload_id).parent();
  if(confirm('<?php echo $text_confirm_delete; ?>?'))
  {
    $.ajax({
      url: _url,
      dataType: 'json',
      beforeSend: function() {
        $(_target).button('loading');
        $('.alert').parent('td').remove();
        $('.alert').remove();
      },
      complete: function() {
        $(_target).button('reset');
      },      
      success: function(json) {
        if(json['success']) {
          $('#upload' + _upload_id).fadeOut(function() {
            $(this).remove();
            if(_thisUploadTbody.find("tr[id^='upload']").length == 0) {
              _thisUploadTbody.find('tr.empty').remove();
              _thisUploadTbody.prepend(empty_row);
            }
            $('input[name=quantity]').val($('.force-qty').length ? $('.force-qty').length : $('input[name=quantity]').val());
          });
        }
        if(json['error']) {
          $(_target).parent().parent().parent().parent().before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"/></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  }
  return false;
}
<?php } ?>
<?php if($upload) { ?>
$('#copu-button-upload').on('click', function() {
  $('#fileupload').trigger('click');
});
//////////////jQuery File Upload//////////////
$('body').prepend('<form enctype="multipart/form-data" id="copu-form-upload" style="display: none;"><input type="file" name="file" id="fileupload" multiple /></form>');
var _url = 'index.php?route=myoc/copu/upload&token=<?php echo $token; ?>&type=<?php echo $type; ?>&customer_id=<?php echo $customer_id; ?>&order_id=<?php echo $order_id; ?>';
$('#fileupload').fileupload({
  url: _url,
  dataType: 'json',
  dropZone: $('#copu-tbl tbody td.upload-ctrl'),
  disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator && navigator.userAgent),
  previewMaxWidth: <?php echo $copu_preview_dimension_w; ?>,
  previewMaxHeight: <?php echo $copu_preview_dimension_h; ?>,
  previewCrop: true,
  disableImageResize: true,
}).on('fileuploadadd', function (e, data) {
  $('.alert').parent('td').remove();
  $('.alert').remove();
  $.each(data.files, function (index, file) {
    $('#copu-tbl tbody tr.empty').remove();

    data.context = $('<tr/>');

    <?php if($upload) { ?>
    $('<input type="hidden" name="<?php echo $type; ?>_upload[]" value=""/>').appendTo(data.context);
    <?php } ?>
    $('<td class="preview text-center"/>').appendTo(data.context);
    $('<td class="name text-left"/>')
      .append($('<span/>').text(truncateFilename(file.name, <?php echo $copu_max_filename_length; ?>)))
      .append($('<br/>'))
      .append($('<div class="progress progress-striped active"/>').append($('<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"/>').text('<?php echo $text_loading; ?>')))
      .appendTo(data.context);
    $('<td class="text-right"/>').append($('<span/>').text(formatFilesize(file.size))).appendTo(data.context);
    $('<td class="text-right"/>').append($('<span/>').text('<?php echo date($date_format_short); ?>')).appendTo(data.context);
    <?php if($delete) { ?>
    $('<td class="action text-right"/>').html('<a class="btn btn-danger" href="" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-times"/></i></a>').appendTo(data.context);
    data.context.find('td.action a').click(function(e) {
      e.preventDefault();
      if(confirm('<?php echo $text_confirm_delete; ?>?')) {
        data.abort();
        data.context.fadeOut(function() { $(this).remove(); });
      }
      return false;
    });
    <?php } ?>
    $('#copu-tbl tbody tr.error-msg').before(data.context);
    data.submit();
  });
}).on('fileuploaddone', function (e, data) {
  if(data.result.error) {
    data.abort();
    data.context.fadeOut(function() { $(this).remove(); });
    var _error_msg = $('<td class="alert alert-danger" colspan="<?php echo $colspan; ?>"/>').text(' ' + data.result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
    $('#copu-tbl tbody .error-msg').html(_error_msg);
  } else {
    <?php if($upload) { ?>
    data.context.find('input[name="<?php echo $type; ?>_upload[]"]').val(data.result.file.upload_id);
    <?php } ?>
    data.context.attr("id", "upload" + data.result.file.upload_id);
    if(data.result.file.popup) {
      data.context.find("td.preview a").attr("href", data.result.file.popup);
    }
    data.context.find("td.name span").html($('<a href="' + data.result.file.href + '" title="<?php echo $text_download; ?>"/>').text(data.result.file.name));
    <?php if($upload) { ?>
    data.context.find("td.action").html('<a onclick="deleteUpload(event, \'' + data.result.file.upload_id + '\', \'' + data.result.file.delete + '\');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="fa fa-times"/></i></a>');
    <?php } ?>
    data.context.find('.progress').removeClass("progress-striped active");
    data.context.find('.progress .progress-bar').text("<?php echo $text_complete; ?>");
    data.context.find('.popup').magnificPopup({
      type: 'image',
      closeOnContentClick: true  
    });
  }
}).on('fileuploadprogress', function (e, data) {
  var progress = parseInt(data.loaded / data.total * 100, 10),
    progressLabel = data.context.find('.progress .progress-bar');
  progressLabel.attr("aria-valuenow", progress);
  progressLabel.css("width", progress + '%');
  progressLabel.text( progress + "%" );
}).on('fileuploadprocessalways', function (e, data) {
  var index = data.index,
    file = data.files[index],
    node = $(data.context.children('td.preview')),
    img = new Image();
  if (file.preview) {
    img.src = file.preview.toDataURL();
    var link = $('<a class="popup"/>');
  } else {
    img.src = "../image/no_image.png";
    var link = $('<span/>');
  }
  link.append(img);
  node.append(link);
  if (file.error) {
    node.append(file.error);
  }
  if (index + 1 === data.files.length) {
    $(data.context.find('#copu-button-upload')).prop('disabled', !!data.files.error);
  }
});
$(document).on('drop dragover', function (e) {
  e.preventDefault();
});
<?php } ?>
//--></script>
<?php } ?>