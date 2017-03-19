<?php
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
    "transfer_enable" => "1099511627776"
        ],[
        "uid" => $rs['uid']
        ]);
}

if( $rs['plan'] == 'D' and $rs['transfer_enable']<='0'){
        $UserInfo->update_plan_go_time(7);
        $Users->db->update("user",[
            "plan"=>'A',
            "transfer_enable" => "10737418240",
            "u"=>'0',
            "d"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }
    
if( $rs['plan'] == 'B' and $rs['transfer_enable']<='0'){
        $UserInfo->update_plan_go_time(7);
        $Users->db->update("user",[
            "plan"=>'A',
            "transfer_enable" => "2147483648",
            "u"=>'0',
            "d"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }

if ($time<=$now){
    if( $rs['plan'] == 'A'){
        $Users->db->update("user",[
            "enable"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }
    if( $rs['plan'] == 'C'){
        $UserInfo->update_plan_go_time(7);
        $Users->db->update("user",[
            "plan"=>'A',
            "transfer_enable" => "2147483648",
            "u"=>'0',
            "d"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }
    if( $rs['plan'] == 'E'){
        $UserInfo->update_plan_go_time(7);
        $Users->db->update("user",[
            "plan"=>'A',
            "transfer_enable" => "2147483648",
            "u"=>'0',
            "d"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }
}
}
