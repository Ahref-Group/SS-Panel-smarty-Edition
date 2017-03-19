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

function get_ss_url($id){
    $node = new \Ss\Node\NodeInfo($id);
    global $oo;
    $server =  $node->Server();
    $method = $node->Method();
	$protocol = $node->protocol(); //protocol
	$obfs = $node->obfs(); //obfs
	$parameter = $node->parameter(); //protocol_param
	
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
		//ssr://base64(host:port:protocol:method:obfs:base64pass/?obfsparam=base64&remarks=base64&group=base64&udpport=0&uot=1)
        $ssurl =  $server.":".$port.":".$protocol.":".$method.":".$obfs.":".base64_encode($pass)."/?obfsparam=".base64_encode($parameter)."&remarks=".base64_encode($server)."&group=".base64_encode('')."&udpport=0&uot=1";
    	return "ssr://".base64_encode($ssurl);
    }
	
	
}


?>
