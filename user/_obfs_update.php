<?php
//开启session
session_start();
require_once '../lib/config.php';
require_once '_check.php';
//引入AES
require_once '../lib/Ss/AES/aes.class.php';
require_once '../lib/Ss/AES/aesctr.class.php';
$newmethod = AesCtr::decrypt($_POST['method'], $_SESSION['randomChar'], 256);
$newprotocol = AesCtr::decrypt($_POST['protocol'], $_SESSION['randomChar'], 256);
$newobfs = AesCtr::decrypt($_POST['obfs'], $_SESSION['randomChar'], 256);
if($oo->get_enable()){
	
	if($newmethod != 'none'){
    	$a['msg']  = "算法是非法参数";
    }else if($newprotocol != 'auth_chain_a' && $newprotocol != 'auth_chain_d' && $newprotocol != 'auth_chain_f'){
    	$a['msg']  = "协议是非法参数";
    }else if($newobfs != 'tls1.2_ticket_auth' && $newobfs != 'plain'){
    	$a['msg']  = "混淆是非法参数";
    }else{
        $method = $newmethod;
    	$method = htmlspecialchars($method, ENT_QUOTES, 'UTF-8');
    	$method = \Ss\Etc\Comm::checkHtml($method);
      
    	$protocol = $newprotocol;
		$protocol = htmlspecialchars($protocol, ENT_QUOTES, 'UTF-8');
		$protocol = \Ss\Etc\Comm::checkHtml($protocol);

		$obfs = $newobfs;
		$obfs = htmlspecialchars($obfs, ENT_QUOTES, 'UTF-8');
		$obfs = \Ss\Etc\Comm::checkHtml($obfs);

    	$oo->update_method($method);
    	$oo->update_protocol($protocol);
    	$oo->update_obfs($obfs);
    
    	$a['ok'] = '1';
    	$a['msg'] = "修改成功！";
    }
}else{
    $a['code'] = '0';
    $a['msg']  = "你的服务已被停止，无法修改配置。";
}
echo json_encode($a,JSON_UNESCAPED_UNICODE);
