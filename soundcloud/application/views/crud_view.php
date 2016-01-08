<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
<?php require_once('requires.php'); ?>
<?php
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />

<?php endforeach; ?>
<?php foreach($js_files as $file): ?>

    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

<style type='text/css'>
body
{
    font-family: Arial;
    font-size: 14px;
}
a {
    color: blue;
    text-decoration: none;
    font-size: 14px;
}
a:hover
{
    text-decoration: underline;
}
</style>
</head>
<body>
    <?php require_once('menu.php'); ?>
<!-- Beginning header -->
    <div>

    </div>
<!-- End of header-->
    <div style='height:20px;'></div>
    <div>
        <?php echo $output; ?>

    </div>
<!-- Beginning footer -->
<div>Footer</div>
<!-- End of Footer -->
</body>
</html>
