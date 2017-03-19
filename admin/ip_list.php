<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
require_once '_main.php';
$ip = new Ss\User\User();
$us = $ip->get_all_user_ip();
$smarty->assign('us',$us);
$smarty->display('admin/ip_list.tpl');
?>