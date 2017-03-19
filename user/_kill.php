<?php
require_once '../lib/config.php';
require_once '_check.php';
// print_r ($_POST);
	if($U->GetPasswd() != $pwd) {
		    $a['error'] = '1';
		    $a['msg'] = "密码错误";
		}else {
			if($oo->get_enable()==3) {
				$a['error'] = '1';
				$a['msg'] = "账号已被锁定，无法删除。";
			}else {
		        $a['ok'] = '1';
		        $a['msg'] = "再见，你已经安全的从我们的数据库中移除。";
		        //remove
		        $U->DelMe();
            }
		}
}else{
	$a['error'] = '1';
    $a['msg'] = "请输入密码";
}

echo json_encode($a);
