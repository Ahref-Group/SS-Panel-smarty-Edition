<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
require_once '_main.php';

$node = new Ss\Node\Node();
$node0 = $node->NodesArray(0); // 普通节点数组
$node1 = $node->NodesArray(1); // Pro节点数组
//Get Node DATA
//这个地方把ss的链接直接扔到node1，2里面去了，
foreach ($node0 as &$node_info) {
    $node_info['qr'] = get_ss_url($node_info['id']);
}


foreach ($node1 as &$node_info) {
    $node_info['qr'] = get_ss_url($node_info['id']);
}

$smarty->assign('plan', $oo->get_plan());
$smarty->assign('oo',$oo);
$smarty->assign('node',$node);
$smarty->assign('node0',$node0);
$smarty->assign('node1',$node1);
$varsarray = get_defined_vars();
$smarty->display('user/node.tpl');


//加了个base64_url_encode(来自v3魔改版)
function base64_url_encode($input){
	return strtr(base64_encode($input), array('+' => '-', '/' => '_', '=' => ''));
}

function get_ss_url($id){
    $node = new \Ss\Node\NodeInfo($id);
    global $oo;
	$name =  $node->Name();
    $server =  $node->Server();
    $method = $oo->get_Method();
	$protocol = $oo->get_protocol(); //protocol
	$obfs = $oo->get_obfs(); //obfs
	$parameter = $node->parameter(); //obfs_param
	$protoparam = '';

	
    $pass = $oo->get_pass();
    $port = $oo->get_port();
    
	
	if (($obfs == 'plain' or $obfs == '') and ($protocol == 'origin' or $protocol == '')  and $parameter == '' ){
		$ssurl =  $method.":".$pass."@".$server.":".$port;
    	return "ss://".base64_encode($ssurl);
    }
	else {
		if ($obfs == 'plain' or $obfs == ''){
		$obfs =  "plain";
        }
		if ($protocol == 'origin' or $protocol == ''){
		$protocol =  "origin";
        }
		
//具体格式: ssr://base64(host:port:protocol:method:obfs:base64pass/?obfsparam=base64param&protoparam=base64param&remarks=base64remarks&group=base64group&udpport=0&uot=0)
       $ssurl = $server.":".$port.":".$protocol.":".$method.":".$obfs.":".base64_url_encode($pass)."/?obfsparam=".base64_url_encode($parameter)."&protoparam=".base64_url_encode($protoparam)."&remarks=".base64_url_encode($name)."&group=".base64_url_encode('KTKK');

    	return "ssr://".base64_url_encode($ssurl);

    }
	
	
}


?>
