<?php
//引入配置文件
require_once '../lib/config.php';
require_once '_check.php';
$uid = $_GET['uid'];
$u = new \Ss\User\UserInfo($uid);
$u->set_enable(1);
echo ' <script>alert("修改成功!")</script> ';
echo " <script>window.location='user.php';</script> " ;
?>