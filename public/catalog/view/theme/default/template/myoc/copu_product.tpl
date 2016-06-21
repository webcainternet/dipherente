<?php if($copu_message) { ?><div><?php echo $copu_message; ?></div><?php } ?>
<table id="copu-tbl-<?php echo $product_option_id; ?>" class="table table-bordered copu-tbl">
  <thead>
    <tr>
      <?php if($copu_preview) { ?><td class="preview" id="previewimg" style="width:<?php echo $copu_preview_dimension_w; ?>px;"><?php echo $column_image; ?></td><?php } ?>
      <td class="name"><?php echo $column_name; ?></td>
      <td class="action"></td>
    </tr>
  </thead>
  <tbody><?php if ($uploads) { ?>
    <?php foreach ($uploads as $upload) { ?>
    <tr id="upload<?php echo $upload['upload_id']; ?>">
      <?php if ($upload['image']) { ?><td class="preview" id="previewimg" style="width:<?php echo $copu_preview_dimension_w; ?>px;">
        <?php if ($upload['popup']) { ?><a href="<?php echo $upload['popup']; ?>" class="popup"><?php } ?><img src="<?php echo $upload['image']; ?>" alt="<?php echo $upload['name']; ?>" title="<?php echo $text_popup; ?>" /><?php if ($upload['popup']) { ?></a><?php } ?>
        </td><?php } ?>
      <td class="name"><a href="<?php echo $upload['href']; ?>" title="<?php echo $text_download; ?>"><?php echo $upload['name']; ?></a><br /><b><?php echo $column_size; ?>:</b> <?php echo $upload['size']; ?></td>     
      <td class="action"><a onclick="deleteUpload(event, '<?php echo $upload['upload_id']; ?>', '<?php echo $upload['delete']; ?>');" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="fa fa-times"></i></a></td>
    </tr>
    <?php } ?>
  <?php } else { ?>
    <tr class="empty"><td colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td></tr>
  <?php } ?>
    <tr class="error-msg"></tr>
    <tr>
      <td colspan="<?php echo $colspan; ?>" class="upload-ctrl">
        <?php if($drag_drop) { ?>
        <div class="drop-zone">
          <p class="bg-text"><?php echo $text_drag_drop; ?></p>
        <?php } ?>
          <button type="button" id="copu-button-upload<?php echo $product_option_id; ?>" class="btn btn-default button-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
        <?php if($drag_drop) { ?></div><?php } ?>
      </td>
    </tr>
  </tbody>
</table>
<input type="hidden" name="copu_product_id[<?php echo $product_option_id; ?>]" value="<?php echo $copu_product_id; ?>" id="input-option<?php echo $product_option_id; ?>" />
</div><!-- close default option <div> -->
<script type="text/javascript"><!--
<?php foreach ($uploads as $upload) { ?>
<?php if($upload['replace']) { ?>
$('.thumbnails li:first').addClass('image-additional');
$('.thumbnails').prepend('<li data-copu-replace="<?php echo $upload['upload_id']; ?>"><a class="thumbnail" href="<?php echo $upload['popup']; ?>"><img src="<?php echo $upload['replace']; ?>" /></a></li>');
<?php } ?>

<?php } ?>
var empty_row = '<tr class="empty"><td colspan="<?php echo $colspan; ?>"><?php echo $text_empty; ?></td></tr>';
$(document).ready(function() {
  <?php if($force_qty) { ?>
  $('input[name=quantity]').val($("tr[id^='upload']").length > 0 ? $("tr[id^='upload']").length : parseInt($('input[name=quantity]').val())); 
  <?php } ?>
  $('.popup').magnificPopup({
    type: 'image',
    closeOnContentClick: true  
  });
  $('#copu-button-upload<?php echo $product_option_id; ?>').on('click', function() {
    $("#fileupload<?php echo $product_option_id; ?>").trigger('click');
  });
});
function deleteUpload(e, _upload_id, _url) {
  var _target = (e.target) ? e.target : e.srcElement;
  var _thisUploadTbody = $("#upload" + _upload_id).parent();
  if(confirm('<?php echo $text_confirm_delete; ?>'))
  {
    $.ajax({
      url: _url,
      dataType: 'json',
      beforeSend: function() {
        $(_target).button('loading');
        $("#button-cart").button('loading');
        $('.alert').remove();
      },
      complete: function() {
        $(_target).button('reset');
        $("#button-cart").button('reset');
      },      
      success: function(json) {
        //console.log(json);
        if(json['success']) {
          $(_target).remove();
          $('#upload' + _upload_id).fadeOut(function() {
            $(this).remove();
            if(_thisUploadTbody.find("tr[id^='upload']").length == 0) {
              _thisUploadTbody.find('tr.empty').remove();
              _thisUploadTbody.prepend(empty_row);
            }
            <?php if($copu_replace) { ?>
            $('.thumbnails li[data-copu-replace="' + _upload_id + '"]').remove();
            $('.thumbnails li:first').removeClass('image-additional');
            <?php } ?>
            <?php if($force_qty) { ?>
            $('input[name=quantity]').val(parseInt($('input[name=quantity]').val()) > 1 ? $("tr[id^='upload']").length : 1);
            <?php } ?>
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
//////////////jQuery File Upload//////////////
$('body').prepend('<form enctype="multipart/form-data" id="form-upload<?php echo $product_option_id; ?>" style="display: none;"><input type="file" name="file" id="fileupload<?php echo $product_option_id; ?>"<?php if($multiple) { ?> multiple<?php } ?> /></form>');
var _url = 'index.php?route=myoc/copu/upload&type=product&type_id=<?php echo $product_id; ?>&product_option_id=<?php echo $product_option_id; ?>&copu_product_id=<?php echo $copu_product_id; ?>';
$('#fileupload<?php echo $product_option_id; ?>').fileupload({
  url: _url,
  dataType: 'json',
  dropZone: <?php if($drag_drop) { ?>$("#copu-tbl-<?php echo $product_option_id; ?> tbody td.upload-ctrl")<?php } else { ?>null<?php } ?>,
  disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator && navigator.userAgent),
  previewMaxWidth: <?php echo $copu_preview_dimension_w; ?>,
  previewMaxHeight: <?php echo $copu_preview_dimension_h; ?>,
  previewCrop: false,
  disableImageResize: true,
  loadImageMaxFileSize: <?php echo $max_filesize; ?>,
}).on('fileuploadadd', function (e, data) {
  $('.alert').remove();
  $.each(data.files, function (index, file) {
    $.getJSON("index.php?route=myoc/copu/validateUpload&type=product&type_id=<?php echo $product_id; ?>&product_option_id=<?php echo $product_option_id; ?>&copu_product_id=<?php echo $copu_product_id; ?>", {"filename":file.name, "filesize":file.size, "filetype":file.type}, function (result) {
      if(result.error) {
        data.abort();
        data.context.fadeOut(function() { $(this).remove(); });
        $('.alert').remove();
        var _error_msg = $('<td class="alert alert-danger" colspan="<?php echo $colspan; ?>"/>').text(' ' + result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
        $('#copu-tbl-<?php echo $product_option_id; ?> tbody .error-msg').html(_error_msg);
        $("#button-cart").button('reset');
      } else {
        data.submit();
      }
    });

    $('#copu-tbl-<?php echo $product_option_id; ?> tbody tr.empty').remove();

    data.context = $('<tr/>');

    <?php if($copu_preview) { ?>
      $('<td class="preview" id="previewimg"/>').appendTo(data.context);
      //alert(JSON.stringify(data.context));
      //////////////FERNANDO//////////////
    <?php } ?>

    $('<td class="name"/>')
      .append($('<span/>').text(truncateFilename(file.name, <?php echo $copu_max_filename_length; ?>)))
      .append($('<br/>'))
      .append('<b><?php echo $column_size; ?>:</b> ' + formatFilesize(file.size))
      .append($('<br/>'))
      .append($('<div class="progress progress-striped active"/>').append($('<div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"/>').text('<?php echo $text_loading; ?>')))
      .appendTo(data.context);

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
    $('#copu-tbl-<?php echo $product_option_id; ?> tbody tr.error-msg').before(data.context);
  });
}).on('fileuploaddone', function (e, data) {
  $("#button-cart").button('reset');
  if(data.result.error) {
    data.abort();
    data.context.fadeOut(function() { $(this).remove(); });
    var _error_msg = $('<td class="alert alert-danger" colspan="<?php echo $colspan; ?>"/>').text(' ' + data.result.error).prepend($('<i class="fa fa-exclamation-circle"/>')).prepend($('<button type="button" class="close" data-dismiss="alert">&times;</button>'));
    $('#copu-tbl-<?php echo $product_option_id; ?> tbody .error-msg').html(_error_msg);
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
    if(data.result.file.replace) {
      $('.thumbnails li:first').addClass('image-additional');
      $('.thumbnails').prepend('<li data-copu-replace="' + data.result.file.upload_id + '"><a class="thumbnail" href="' + data.result.file.popup + '"><img src="' + data.result.file.replace + '" /></a></li>');
    }
    <?php if($force_qty) { ?>
    $('input[name=quantity]').val($("tr[id^='upload']").length);
    <?php } ?>
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
  $("#button-cart").button('loading');
})<?php if($copu_preview) { ?>.on('fileuploadprocessalways', function (e, data) {
  var index = data.index,
    file = data.files[index],
    node = $(data.context.children('td.preview')),
    img = new Image();
  if (file.preview) {
    img.src = file.preview.toDataURL();
    //////////////FERNANDO//////////////
    //alert(img.src);
    document.getElementById("mascara").style.backgroundColor = "none";
    document.getElementById("mascara").style.backgroundImage = 'url(' + img.src + ')';
    document.getElementById("mascara").style.border = '0px';
    //$('mascara').css('background-color', 'red');
    //$('mascara').css('background-image', 'url(' + img.src + ')');

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
    $(data.context.find('.button-upload')).prop('disabled', !!data.files.error);
  }    
})<?php } ?>;
$(document).on('dragover drop', function (e) {
  e.preventDefault();
});
//--></script>