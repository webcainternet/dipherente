<p><b><?php echo $text_upload; ?></b></p>
<table class="table table-bordered product">
  <thead>
    <tr>
      <td class="text-left"><b><?php echo $column_name; ?></b></td>
      <td class="text-right"><b><?php echo $column_size; ?></b></td>
    </tr>
  </thead>
  <tbody>
    <?php if ($uploads) { ?>
    <?php foreach ($uploads as $file) { ?>
    <tr>
      <td class="text-left"><?php echo $file['name']; ?></td>
      <td class="text-right"><?php echo $file['size']; ?></td>
    </tr>
    <?php } ?>
    <?php } else { ?>
    <tr>
      <td class="text-center" colspan="2"><?php echo $text_empty; ?></td>
    </tr>
    <?php } ?>
  </tbody>
</table>