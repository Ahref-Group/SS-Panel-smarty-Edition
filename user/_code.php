<?php
ini_set("display_errors", "On");

error_reporting(E_ALL | E_STRICT);
session_start();
require_once '_main.php';

$Code = new Ss\Code\Code();
$UserInfo = new Ss\User\UserInfo($uid);
$Plan = new Ss\Plan\Plan();

if (isset($_GET['method'])){
    $method = $_GET['method'];
    if($method == 'redeem' || $method =='test' && isset($_GET['code'])){
        $code = $_GET['code'];
        if (strlen($code) == 22){
            $ret =$Code->check_code($code);
            if($ret['status'] == 'invalid'){
                echo json_encode($ret);
                exit;
            }
            if($method == 'redeem'){
                //正确
                $current_plan = $UserInfo->get_plan();
                $user_info = $UserInfo->UserArray();
                $plan = $Plan -> get_plan($ret['plan'], $ret['plan_id']);
                // var_dump($plan);
                switch ($plan['type']) {
                    case 'Tc'://普通流量
						if($current_plan != 'B'){
                    	$UserInfo->update_transfer($plan['data']*1024*1024*1024);
                    	$UserInfo->Changeplan('B');
                    	$UserInfo->clean_user_transfer();
						$UserInfo->update_plan_go_time(365);
                    	}
                    	else{
                    	$UserInfo->update_transfer($user_info['transfer_enable']+$plan['data']*1024*1024*1024);
						$UserInfo->update_plan_go_time(365);
		    			}
			            if ($oo->get_enable() == 0){
                            $UserInfo->set_enable(1);
                        }
                        $info ='兑换成功！<br>您成功添加了'.$plan['data'].'GB的普通节点流量<br>当前流量：'.$UserInfo->get_transfer()/1073741824.0.' GB';
                        break;
                        
                    case 'Ta'://高级流量
                        //高级流量不计算剩余流量
                        if($current_plan != 'D'){
                        $UserInfo->update_transfer($plan['data']*1024*1024*1024);
                        $UserInfo->Changeplan('D');
                        $UserInfo->clean_user_transfer();
						$UserInfo->update_plan_go_time(365);
                        }
                        else{
                        $UserInfo->update_transfer($user_info['transfer_enable']+$plan['data']*1024*1024*1024);
						$UserInfo->update_plan_go_time(365);
						}
			            if ($oo->get_enable() == 0){
                            $UserInfo->set_enable(1);
                        }
                        $info ='兑换成功！<br>您成功添加了'.$plan['data'].'GB的高级节点流量<br>当前流量：'.$UserInfo->get_transfer()/1073741824.0.' GB';
                        break;
                        
                    case 'Ca'://高级周期
                        if($current_plan != 'E'){
						$UserInfo->Changeplan('E');
						$UserInfo->update_plan_go_time($plan['data']);
						$UserInfo->update_transfer(1099511627776);
						}
						else{
						$UserInfo->update_plan_end_time($plan['data']);
						}
						if ($oo->get_enable() == 0){
                            $UserInfo->set_enable(1);
                        }
						$info ='成功！<br>您已修改为高级节点无限流量套餐！<br>到期日期：<code>'.date('Y-m-d H:i:s', $UserInfo->get_plan_end_time()).'</code>';
						break;
                    case 'Cc'://普通周期
                        if($current_plan != 'C'){
                        $UserInfo->Changeplan('C');
                        $UserInfo->update_plan_go_time($plan['data']);
                        $UserInfo->update_transfer(214748364800);
                        }
		                else{
                        $UserInfo->update_plan_end_time($plan['data']);
		                }
			            if ($oo->get_enable() == 0){
                            $UserInfo->set_enable(1);
                        }
                        $info ='成功！<br>您已修改为普通节点无限流量套餐！<br>到期日期：<code>'.date('Y-m-d H:i:s', $UserInfo->get_plan_end_time()).'</code>';
                        break;
                    case 'M'://钱
                        $UserInfo->AddMoney($plan['data']);
                        $info = '兑换成功<br>当前账户余额为： <code>'.$UserInfo->Money().'</code> 喵币';
                        break;
                }
                $Code->set_used_id($ret['id'], $uid);
                echo json_encode(array('status'=>'success', 'info'=>$info));
                exit;
            }
            elseif($method == 'test'){
                $current_plan = $UserInfo->get_plan();
                $plan = $Plan -> get_plan($ret['plan'], $ret['plan_id']);
                $info = '兑换码到期時間：<code>'.date('Y-m-d H:i:s', $ret['time']).'</code>';
                switch ($plan['type']) {
                    case 'Ta':
                        $info = '本兑换码包含：高级流量'.$plan['data'].'GB<br>价值为：'.$plan['money'].'喵币';
                        $plan['plan'] = 'D';
                        break;
                    case 'Tc':
                        $info='本兑换码包含：普通流量'.$plan['data'].'GB<br>价值为：'.$plan['money'].'喵币';
                        $plan['plan'] = 'B';
                        break;
                    case 'Ca':
                        $info='本兑换码包含：高级用户，不限流量<br>使用期限：'.$plan['data'].'天<br>价值为：'.$plan['money'].'喵币';
                        $plan['plan'] = 'E';
                        break;
                    case 'Cc':
                        $info='本兑换码包含：普通用户，不限流量<br>使用期限：'.$plan['data'].'天<br>价值为：'.$plan['money'].'喵币';
                        $plan['plan'] = 'C';
                        break;
                    case 'M':
                        $info = '本兑换码包含喵币'.$plan['data'].'个';
                        $plan['plan'] = $current_plan;
                        break;
                }
                if ($current_plan != $plan['plan'])
                    $info .= '<br><span style="color:red;">您现在的计划类型与您要兑换的不同，继续兑换将覆盖原有计划。即使您再次兑换原有计划流量也会重新计算。请谨慎操作！</span>';
                echo json_encode(array('status'=>'success', 'info'=>$info));
                exit;
            }
        }
        else{
            echo json_encode(array('status'=>'invalid', 'info'=>'无效的兑换码，请检查！'));
            exit;
        }
        
    }
}
echo json_encode(array('status'=>'invalid', 'info'=>'无效的请求类型！'));
