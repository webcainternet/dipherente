<?php echo $header; ?>
<style>
h2 {
    border-left: solid 10px #f7b04a;
    padding: 10px;
}
.account-cubo {
  background: #f3f3f4;
  display: inline-block;
  padding: 45px 15px;
  margin: 15px;
  width: 250px;
  text-align: center;
  font-size: 18px;
}
.account-cubo:hover {
  color: #f3f3f4;
  background: #2b2e39;
}
.account-cubo:hover a {
  color: #f3f3f4;
}

.account-cubo a {
  color: #2b2e39;
}
.icongrande {
  font-size: 64px;
  margin-bottom: 15px;
}
</style>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_my_account; ?></h2>

        <div class="account-cubo">
          <i class="fa fa-users icongrande"></i><br>
          <a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-unlock-alt icongrande"></i><br>
          <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-map-marker icongrande"></i><br>
          <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-gift icongrande"></i><br>
          <a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></div>
<?php if($copu_customer) { ?>
					<li><a href="<?php echo $copu_customer; ?>"><?php echo $text_copu_customer; ?></a></li>
				<?php } ?>

      <h2 style="margin-top: 30px;"><?php echo $text_my_orders; ?></h2>

        <div class="account-cubo">
          <i class="fa fa-history icongrande"></i><br>
          <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-download icongrande"></i><br>
          <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></div>
        <?php if ($reward) { ?>
        <div class="account-cubo">
          <i class="fa fa-bookmark icongrande"></i><br>
          <a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></div>
        <?php } ?>
        <div class="account-cubo">
          <i class="fa fa-ban icongrande"></i><br>
          <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-tasks icongrande"></i><br>
          <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></div>
        <div class="account-cubo">
          <i class="fa fa-circle-o-notch icongrande"></i><br>
          <a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></div>

      <h2 style="margin-top: 30px;"><?php echo $text_my_newsletter; ?></h2>

        <div class="account-cubo">
          <i class="fa fa-envelope icongrande"></i><br>
          <a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
