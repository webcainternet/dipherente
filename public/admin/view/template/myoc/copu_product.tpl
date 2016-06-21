<?php if($html) { ?>
html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
html += '  <div class="col-sm-10 table-responsive">';
html += '    <table id="copu-tbl-' + option['product_option_id'] + '" class="table table-bordered copu-tbl">';
html += '      <thead>';
html += '        <tr>';
html += '          <td class="text-center"><?php echo $column_image; ?></td>';
html += '          <td class="text-left"><?php echo $column_name; ?></td>';
html += '          <td class="text-right"><?php echo $column_action; ?></td>';
html += '        </tr>';
html += '      </thead>';
html += '      <tbody>';
html += '        <tr class="empty">';
html += '          <td class="text-center" colspan="3"><?php echo $text_empty; ?></td>';
html += '        </tr>';
html += '        <tr class="error-msg"></tr>';
html += '        <tr>';
html += '          <td colspan="3" class="upload-ctrl">';
html += '            <div class="drop-zone">';
html += '              <p class="bg-text"><?php echo $text_drag_drop; ?></p>';
html += '              <button type="button" id="copu-product-button-upload' + option['product_option_id'] + '" class="btn btn-default button-upload" data-poid="' + option['product_option_id'] + '"><i class="fa fa-upload"></i> <?php echo $button_upload; ?>';
html += '              </button>';
html += '            </div>';
html += '          </td>';
html += '        </tr>';
html += '      </tbody>';
html += '    </table>';
html += '  </div>';
html += '</div>';
<?php } ?>
<?php if($javascript) { ?>
//////////////jQuery File Upload//////////////
for (i = 0; i < item['option'].length; i++) {
  option = item['option'][i];
  if (option['type'] == 'file') {
    $('body').prepend('<form enctype="multipart/form-data" id="copu-form-upload' + option['product_option_id'] + '" style="display: none;"><input type="file" name="file" id="fileupload' + option['product_option_id'] + '" multiple /><input type="hidden" name="product_option_id" value="' + option['product_option_id'] + '" /></form>');
    $('#copu-product-button-upload' + option['product_option_id']).on('click', function() {
      $('#fileupload' + $(this).data("poid")).trigger('click');
    });
    var _url = 'index.php?route=myoc/copu/upload&token=<?php echo $token; ?>&type=product&option_id=' + option['option_id'] + '&product_option_id=' + option['product_option_id'] + '&customer_id=<?php echo $customer_id; ?>&order_id=<?php echo $order_id; ?>&product_id=' + $("input[name='product_id']").attr('value');
    $('#fileupload' + option['product_option_id']).fileupload({
      url: _url,
      dataType: 'json',
      dropZone: $('#copu-tbl-' + option['product_option_id'] + ' tbody td.upload-ctrl'),
      disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator && navigator.userAgent),
      previewMaxWidth: 100,
      previewMaxHeight: 100,
      previewCrop: true,
      disableImageResize: true,
    }).on('fileuploadadd', function (e, data) {
      var product_option_id = $(this).next('input[name=product_option_id]').val();
      $('.alert').remove();
      $.each(data.files, function (index, file) {
        $('#copu-tbl-' + product_option_id + ' tbody tr.empty').remove();

        data.context = $('<tr/>');

        $('<input type="hidden" name="option[' + product_option_id + '][]" value=""/>').appendTo(data.context);
        $('<td class="preview center"/>').appendTo(data.context);
        $('<td class="name left"/>')
          .append($('<span/>').text(truncateFilename(file.name, 30)))
          .append($('<br/>'))
          .append('<b><?php echo $column_size; ?>:</b> ' + formatFilesize(file.size))
          .append($('<br/>'))
          .append($('<div class="progress progress-striped active"/>').append($('<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"/>').text('<?php echo $text_loading; ?>')))
          .appendTo(data.context);
        $('<td class="action right"/>').append('<a class="btn btn-danger" href="" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-times"/></i></a>').appendTo(data.context);
        data.context.find('td.action a').click(function(e) {
          e.preventDefault();
          if(confirm('<?php echo $text_confirm_delete; ?>?')) {
            data.abort();
            data.context.fadeOut(function() { $(this).remove(); });
          }
          return false;
        });
        $('#copu-tbl-' + product_option_id + ' tbody tr.error-msg').before(data.context);
        data.submit();
      });
    }).on('fileuploaddone', function (e, data) {
      var product_option_id = $(this).next('input[name=product_option_id]').val();
      if(data.result.error) {
        data.abort();
        data.context.fadeOut(function() { $(this).remove(); });
        var _error_msg = $('<td class="alert alert-danger" colspan="3"/>').text(' ' + data.result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
        $('#copu-tbl-' + product_option_id + ' tbody tr.error-msg').html(_error_msg);
      } else {
        data.context.find('input[name="option[' + product_option_id + '][]"]').val(data.result.file.code);
        data.context.attr("id", "upload" + data.result.file.upload_id);
        if(data.result.file.popup) {
          data.context.find("td.preview a").attr("href", data.result.file.popup);
        }
        data.context.find("td.name span").html($('<a href="' + data.result.file.href + '" title="<?php echo $text_download; ?>"/>').text(data.result.file.name));
        data.context.find("td.action").html('<a onclick="deleteUpload(event, \'' + data.result.file.upload_id + '\', \'' + data.result.file.delete + '\');" class="btn btn-danger' + (data.result.file.force_qty ? ' force-qty' : '') + '" data-toggle="tooltip" title="<?php echo $text_delete; ?>"><i class="fa fa-times"/></i></a>');
        data.context.find('.progress').removeClass("progress-striped active");
        data.context.find('.progress .progress-bar').text("<?php echo $text_complete; ?>");
        
        $('input[name=quantity]').val($('.force-qty').length ? $('.force-qty').length : $('input[name=quantity]').val());
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
        $(data.context.find('.button-upload')).prop('disabled', !!data.files.error);
      }    
    });
  }
}
$(document).on('drop dragover', function (e) {
  e.preventDefault();
});
<?php } ?>