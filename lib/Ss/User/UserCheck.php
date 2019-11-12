<?php
/**
 * User check
 */

namespace Ss\User;


class UserCheck {

    private $db;

    function __construct(){
        global $db;
        $this->db  = $db;
    }

    //is username used
    function IsUsernameUsed($username){
        if($this->db->has("user",[
            "user_name" => $username
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    //is email used
    function IsEmailUsed($email){
        if($this->db->has("user",[
            "email" => $email
        ])){
            return 1;
        }else{
            return 0;
        }
    }


    //
    function IsEmailLegal($email){
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 1;
        }else{
            return 0;
        }
    }

    //login check
    function login_check($username,$passwd){
        if($this->db->has("user",[
            "AND" => [
                "OR" => [
                    "user_name" => $username,
                    "email" => $username
                ],
                "pass" => $passwd
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    //email Login
    function EmailLogin($email,$passwd){
        if($this->db->has("user",[
            "AND" => [
                 "email" => $email,
                "pass" => $passwd
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    function UsernameEmailCheck($username,$email){
        if($this->db->has("user",[
            "AND" => [
                    "user_name" => $username,
                    "email" => $email
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }
    
    
    function save_ip($uid){
         $ip = get_user_ip();

         $location = resolve_ip($ip);
         $this->db->insert('login_ip', ['uid'=>$uid, 'ip'=>$ip, 'location'=>$location, 'time'=>time()]);
         if($this->db->count('login_ip', ['uid' => $uid]) > 10){
             $id = $this->db->select('login_ip','id' ,['uid' => $uid, 'ORDER'=>'id', 'LIMIT' => 1])[0];
             #var_dump($id);
             $this->db->delete('login_ip', ['id' => $id]);
         }
     }
}

function resolve_ip($ip){
     //返回ip对应的地址
    
    //如果服务器被墙了用不了淘宝IP库那就这样 起码能登录
    return 'IP库暂不可用';
    
    
    //taobao API
    // $result = json_decode(file_get_contents("http://ip.taobao.com/service/getIpInfo.php?ip=".$ip), true);
    // if($result['code'] == 0){
    //     return $result['data']['country'].' '.$result['data']['region'].
    //         ' '.$result['data']['city'].' '.$result['data']['isp'];
    // }
    
    // else 
    //     return '查询失败';
    
    //IPIP.NET付费API
    //如使用请注释掉上方taobao API并修改下方token值
    // $ch = curl_init();
    // curl_setopt($ch, CURLOPT_URL, "http://ipapi.ipip.net/find?addr=".$ip);
    // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    // curl_setopt($ch, CURLOPT_HTTPHEADER, array('Token: Input_Your_Token_There'));
    
    // $output = json_decode(curl_exec($ch), true);
    // if($output['ret'] == 'ok'){
    //     $info = $output['data'][0].' '.$output['data'][1].' '.$output['data'][2].' '.$output['data'][3].
    //     ' '.$output['data'][4];
    // }
    // else 
    //     $info = '查询失败'.$output['msg'];
    // return $info;
}

/*获取真实IP*/
function get_user_ip(){
    $user_IP = '';  
    $unknown = 'unknown';  
    if (isset($_SERVER)){  
        if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], $unknown)){  
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);  
            foreach($arr as $realip){  
                $realip = trim($realip);  
                if ($realip != 'unknown'){  
                    $user_IP = $realip;  
                    break;  
                }  
            }  
        }else if(isset($_SERVER['HTTP_CLIENT_IP']) && !empty($_SERVER['HTTP_CLIENT_IP']) && strcasecmp($_SERVER['HTTP_CLIENT_IP'], $unknown)){  
            $user_IP = $_SERVER['HTTP_CLIENT_IP'];  
        }else if(isset($_SERVER['REMOTE_ADDR']) && !empty($_SERVER['REMOTE_ADDR']) && strcasecmp($_SERVER['REMOTE_ADDR'], $unknown)){  
            $user_IP = $_SERVER['REMOTE_ADDR'];  
        }else{  
            $user_IP = $unknown;  
        }  
    }else{  
        if(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), $unknown)){  
            $user_IP = getenv("HTTP_X_FORWARDED_FOR");  
        }else if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), $unknown)){  
            $user_IP = getenv("HTTP_CLIENT_IP");  
        }else if(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), $unknown)){  
            $user_IP = getenv("REMOTE_ADDR");  
        }else{  
            $user_IP = $unknown;  
        }  
    }  
    $user_IP = preg_match("/[\d\.]{7,15}/", $user_IP, $matches) ? $matches[0] : $unknown;  
    return $user_IP;  
}
