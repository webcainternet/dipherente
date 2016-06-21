<h2><?php echo $text_upload; ?></h2>
	<?php if($copu_message) { ?><div><?php echo $copu_message; ?></div><?php } ?>	
  <?php if($error_upload_minimum) { ?><div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_upload_minimum; ?></div><?php } ?>
  <table class="table table-bordered copu-tbl">
		<thead>
		  <tr>
		    <?php if($copu_preview) { ?><td class="preview"><?php echo $column_image; ?></td><?php } ?>
		    <td class="name"><?php echo $column_name; ?></td>
		    <td class="size"><?php echo $column_size; ?></td>
        <?php if($date) { ?><td class="date"><?php echo $column_date; ?></td><?php } ?>
		    <?php if($action) { ?><td class="action"><?php echo $column_action; ?></td><?php } ?>
		  </tr>
		</thead>
		<tbody><?php if ($uploads) { ?>
      <?php foreach ($uploads as $upload) { ?>
      <tr id="upload<?php echo $upload['upload_id']; ?>">
        <?php if ($upload['image']) { ?><td class="preview">
          <?php if ($upload['popup']) { ?><a href="<?php echo $upload['popup']; ?>" class="popup"><?php } ?><img src="<?php echo $upload['image']; ?>" alt="<?php echo $upload['name']; ?>" title="<?php echo $text_popup; ?>" /><?php if ($upload['popup']) { ?></a><?php } ?>
          </td><?php } ?>
        <td class="name"><a href="<?php echo $upload['href']; ?>" title="<?php echo $text_download; ?>"><?php echo $upload['name']; ?></a></td>
        <td class="size"><?php echo $upload['size']; ?></td>   
        <?php if($date) { ?><td class="date"><?php echo $upload['date']; ?></td><?php } ?>
        <?php if($action) { ?><td class="action"><a onclick="deleteUpload(event, '<?php echo $upload['upload_id']; ?>', '<?php echo $upload['delete']; ?>');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></a></td><?php } ?>
      </tr>
      <?php } ?>
    <?php } else { ?>
      <tr class="empty"><td colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td></tr>
    <?php } ?>
    <?php if($action || $copu_order_history_modify) { ?>
      <tr class="error-msg"></tr>
		  <tr>
		    <td colspan="<?php echo $colspan; ?>" class="upload-ctrl">
          <?php if($drag_drop) { ?>
          <div class="drop-zone">
            <p class="bg-text"><?php echo $text_drag_drop; ?></p>
          <?php } ?>
            <button type="button" id="button-upload" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
          <?php if($drag_drop) { ?></div><?php } ?>
        </td>
		  </tr>
    <?php } ?>
		</tbody>
  </table>
<script type="text/javascript"><!--
$('.popup').magnificPopup({
  type: 'image',
  closeOnContentClick: true  
});
<?php if($action) { ?>
var empty_row = '<tr class="empty"><td colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td></tr>';
function deleteUpload(e, _upload_id, _url) {
  var _target = (e.target) ? e.target : e.srcElement;
  if(confirm('<?php echo $text_confirm_delete; ?>'))
  {
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
          $('#upload' + _upload_id).fadeOut(function() {
            $(this).remove();
            if($(".copu-tbl tbody tr[id^='upload']").length == 0) {
              $('.copu-tbl tbody tr.empty').remove();
              $('.copu-tbl tbody').prepend(empty_row);
            }
          });
        }
        if(json['error']) {
          alert(json['error']);
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
<?php if($action || $copu_order_history_modify) { ?> 
//////////////jQuery File Upload//////////////
$('#button-upload').on('click', function() {
  $('#fileupload').trigger('click');
});
$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" id="fileupload"<?php if($multiple) { ?> multiple<?php } ?> /></form>');
var _url = 'index.php?route=myoc/copu/upload&type=<?php echo $type; ?>&type_id=<?php echo $type_id; ?><?php echo $nosession; ?>';
$('#fileupload').fileupload({
  url: _url,
  dataType: 'json',
  dropZone: <?php if($drag_drop) { ?>$('.copu-tbl tbody td.upload-ctrl')<?php } else { ?>null<?php } ?>,
  disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator && navigator.userAgent),
  previewMaxWidth: <?php echo $copu_preview_dimension_w; ?>,
  previewMaxHeight: <?php echo $copu_preview_dimension_h; ?>,
  previewCrop: false,
  disableImageResize: true,
  loadImageMaxFileSize: <?php echo $max_filesize; ?>,
}).on('fileuploadadd', function (e, data) {
  $('.alert').remove();
  $.each(data.files, function (index, file) {
    //console.log(file);
    $.getJSON("index.php?route=myoc/copu/validateUpload&type=<?php echo $type; ?>&type_id=<?php echo $type_id; ?><?php echo $nosession; ?>", {"filename":file.name, "filesize":file.size, "filetype":file.type}, function (result) {
      if(result.error) {
        data.abort();
        data.context.fadeOut(function() { $(this).remove(); });
        $('.alert').remove();
        var _error_msg = $('<td class="alert alert-danger" colspan="<?php echo $colspan; ?>"/>').text(' ' + result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
        $('.copu-tbl tbody .error-msg').html(_error_msg);
      } else {
        data.submit();
      }
    });

    $('.copu-tbl tbody tr.empty').remove();

    data.context = $('<tr/>');

    <?php if($copu_preview) { ?>
    $('<td class="preview"/>').appendTo(data.context);
    <?php } ?>
    $('<td class="name"/>')
      .append($('<span/>').text(truncateFilename(file.name, <?php echo $copu_max_filename_length; ?>)))
      .append($('<br/>'))
      .append($('<div class="progress progress-striped active"/>').append($('<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"/>').text('<?php echo $text_loading; ?>')))
      .appendTo(data.context);
    $('<td class="size"/>').append($('<span/>').text(formatFilesize(file.size))).appendTo(data.context);
    <?php if($date) { ?>
    $('<td class="date"/>').append($('<span/>').text('<?php echo date($date_format_short); ?>')).appendTo(data.context);
    <?php } ?>
    <?php if($action) { ?>
    $('<td class="action"/>').append($('<a class="btn btn-danger" href="" data-toggle="tooltip" title="<?php echo $button_remove; ?>"/>').append($('<i class="fa fa-times"/>'))).appendTo(data.context);
    data.context.find('td.action a').click(function(e) {
      e.preventDefault();
      if(confirm('<?php echo $text_confirm_delete; ?>')) {
        data.abort();
        data.context.fadeOut(function() { $(this).remove(); });
      }
      return false;
    });
    <?php } ?>
    $('.copu-tbl tbody tr.error-msg').before(data.context);
  });
}).on('fileuploaddone', function (e, data) {
  if(data.result.error) {
    data.abort();
    data.context.fadeOut(function() { $(this).remove(); });
    var _error_msg = $('<td class="alert alert-danger" colspan="<?php echo $colspan; ?>"/>').text(' ' + data.result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
    $('.copu-tbl tbody .error-msg').html(_error_msg);
  } else {
    data.context.attr("id", "upload" + data.result.file.upload_id);
    <?php if($copu_preview) { ?>
    data.context.find("td.preview a").attr("href", data.result.file.popup);
    <?php } ?>
    data.context.find("td.name span").html($('<a href="' + data.result.file.href + '" title="<?php echo $text_download; ?>"/>').text(data.result.file.name));
    <?php if($action) { ?>
    data.context.find("td.action").html($('<a onclick="deleteUpload(event, \'' + data.result.file.upload_id + '\', \'' + data.result.file.delete + '\');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_remove; ?>"/>').append($('<i class="fa fa-times"/>')));
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
})<?php if($copu_preview) { ?>.on('fileuploadprocessalways', function (e, data) {
  var index = data.index,
    file = data.files[index],
    node = $(data.context.children('td.preview')),
    img = new Image();
  if (file.preview) {
    img.src = file.preview.toDataURL();
    var link = $('<a class="popup"/>');
  } else {
    img.src = "<?php echo $no_image; ?>";
    var link = $('<span/>');
  }
  link.append(img);
  node.append(link);
  if (file.error) {
    node.append(file.error);
  }
  if (index + 1 === data.files.length) {
    $('#button-upload').prop('disabled', !!data.files.error);
  }    
})<?php } ?>;
$(document).on('drop dragover', function (e) {
  e.preventDefault();
});
<?php } ?>
//--></script>