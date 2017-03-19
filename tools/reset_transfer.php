<?php
//只清零高级套餐流量
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);

require_once '../lib/config.php';

$Users = new Ss\User\User();
$us = $Users->AllUser();
$smarty->assign('us',$us);

foreach ($us as $rs){
$time = $rs['plan_end_time'];
$now = time();
$UserInfo = new Ss\User\UserInfo($rs['uid']);
    
if($rs['plan'] == 'E'||$rs['plan'] == 'C'){
    $Users->db->update("user",[
    "u" => "0",
	"d" => "0"
        ],[
        "uid" => $rs['uid']
        ]);
}
}
