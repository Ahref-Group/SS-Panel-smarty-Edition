<?php

namespace Ss\User;


class UserInfo {

    public  $uid;
    private $db;

    private $table = "user";

    function __construct($uid=0){
        global $db;
        $this->uid = $uid;
        $this->db  = $db;
    }

    //user info array
    function UserArray(){
        $datas = $this->db->select($this->table,"*",[
            "uid" => $this->uid,
            "LIMIT" => "1"
        ]);
        if (sizeof($datas) == 0){
            $datas[0]['user_name']='用户不存在';
        }
        return $datas['0'];
    }

    function GetPasswd(){
        return $this->UserArray()['pass'];
    }

    function GetEmail(){
        return $this->UserArray()['email'];
    }

    function GetUserName(){
        return $this->UserArray()['user_name'];
    }

    function RegDate(){
        return $this->UserArray()['reg_date'];
    }

    function RegDateUnixTime(){
        return strtotime($this->RegDate());
    }

    function InviteNum(){
        return $this->UserArray()['invite_num'];
    }

    function InviteNumToZero(){
        $this->db->update("user",[
            "invite_num" => '0'
        ],[
            "uid" => $this->uid
        ]);
    }
    function  get_plan(){
        return $this->UserArray()['plan'];
    }
    
    function get_transfer(){
        return $this->UserArray()['transfer_enable'];
    }
    
    function get_plan_end_time(){
        return $this->UserArray()['plan_end_time'];
    }

    
    function update_transfer($transfer){
        // $current_transfer = $this->UserArray()['transfer_enable'];
        $this->db->update('user', ['transfer_enable'=>$transfer], ['uid'=>$this->uid]);
    }
    function clean_user_transfer(){
        $this->db->update('user', ['u'=>'0','d'=>'0', ], ['uid'=>$this->uid]);
    }
    
    function ChangePlan($plan){
        $this->db->update("user",[
            "plan"=>$plan,
            ],[
                "uid"=>$this->uid
            ]);
    }
    
    function update_plan_end_time($data){
        $current_end_time = $this->get_plan_end_time();
        if ($current_end_time > time())
            $data = $current_end_time + $data*86400;
        else
            $data = time() + $data*86400;
            
        $this->db->update("user",[
            "plan_end_time"=>$data,
            ],[
                "uid"=>$this->uid
            ]);
    }
    
    function update_plan_go_time($data){
        $current_end_time = $this->get_plan_end_time();
        $data = time() + $data*86400;
        $this->db->update("user",[
            "plan_end_time"=>$data,
            ],[
                "uid"=>$this->uid
            ]);
    }
    
    function Money(){
        return $this->UserArray()['money'];
    }

    function AddMoney($money){
        $this->db->update("user",[
            "money[+]" => $money
        ],[
            "uid" => $this->uid
        ]);
    }

    function GetRefCount(){
        $c = $this->db->count($this->table,"uid",[
            "ref_by" => $this->uid
        ]);
        return $c;
    }
    
    function UpdatePwd($pass){
        $this->db->update("user",[
            "pass" => $pass
        ],[
            "uid" => $this->uid
        ]);
    }

    function isAdmin(){
        if($this->db->has("ss_user_admin",[
            "uid" => $this->uid
        ])){
            return true;
        }else{
            return false;
        }
    }

    function DelMe(){
        $this->db->delete($this->table,[
            "uid" => $this->uid
        ]);
    }
    
    function get_user_ip(){
        return $this->db->select('login_ip', '*', ['uid' => $this->uid])[0];
    }
    
    function get_user_ip_list(){
        return $this->db -> select('login_ip', '*', ['uid' => $this->uid, 'ORDER' => 'time DESC']);
    }
    
    function set_enable($enable){
        $this->db->update('user', ['enable' => $enable], ['uid'=>$this->uid]);
    }
    
}
