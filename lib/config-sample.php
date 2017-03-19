<?php
// DNSPod-D监控和百度云观测访问都不继续执行,直接输出空白页,让对方服务器了解现在是正常状态。
if(preg_match('/DNSPod-Monitor|Baidu-YunGuanCe/i',$_SERVER['HTTP_USER_AGENT'])){exit();}
//防蜘蛛爬虫处理,直接输出404。
elseif(preg_match('/qihoobot|Baiduspider|Googlebot|Googlebot-Mobile|Googlebot-Image|Mediapartners-Google|Adsbot-Google|Feedfetcher-Google|Yahoo! Slurp|Yahoo! Slurp China|YoudaoBot|Sosospider|Sogou spider|Sogou web spider|MSNBot|ia_archiver|Tomato Bot/i',$_SERVER['HTTP_USER_AGENT'])){
    header('HTTP/1.1 404 Not Found'); 
    header("status: 404 Not Found"); 
    include($_SERVER['DOCUMENT_ROOT'].'/404.html');
    exit();
}





/*
 *兑换码相关配置
 *密匙请根据实际情况修改
 */

//生成密匙，长度必须为16比特
$generate_key = md5('asswecan', true);

//校验密匙，应当为一个0X0000 - 0XFFFF的数，若超出此范围，实际计算时会对其取余
//修改校验密匙将使得之前生成的所有兑换码失效
//若兑换码的ID耗尽（共65536个），请修改此校验密匙，让后在生成页面执行刷新ID操作
//警告：以上操作将会使得之前所有生成且未兑换的兑换码失效！
$check_key    = 0X0000;

/*
 * ss-panel配置文件
 * https://github.com/orvice/ss-panel
 * Author @orvice
 * https://orvice.org
 */

//定义流量
$tokb = 1024;
$tomb = 1024*1024;
$togb = $tomb*1024;
//Define DB Connection  数据库信息
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PWD','asswecan');
define('DB_DBNAME','ss-panel');
define('DB_CHARSET','utf8');
define('DB_TYPE','mysql'); 
/*
 * 下面的东西根据需求修改
 */

// SQLite 数据库目录和名称信息
//
//请把 sqliteFileDir sqliteFileName 都修改为任意内容
//
define('SQLITEDIR','SQLITEDIR-'.hash('sha256',"asswecan"));
define('SQLITEDB','SQLITEDB-'.hash('sha256',"asswecan").".tpl");

//define Plan
//注册用户的初始化流量
//默认5GiB
$a_transfer = $togb*5;

//签到设置 签到活的的最低最高流量,单位MB
$check_min = 233;
$check_max = 666;

//name
//站点地址务必带最后的"/"
$site_name = "SS-Panel";
$site_url  = "http://your.domain.com/";
/**
 * 站点盐值，用于加密密码
 * 第一次安装请修改此值，安装后请勿修改！！否则会使所有密码失效，仅限加密方式不为1的时候有效
 */
$salt = "asswecan";
/**
 * 密码加密方式，注意： 2.4以前的版本，请修改加密方式为「1」，否则会使密码失效！
 * 更多说明见wiki https://github.com/orvice/ss-panel/wiki/Install-Guide-zh_cn
 * 加密方式:
 * 1 md5
 * 2 带salt的Sha256加密，新安装建议使用此加密方式！
 */
$pwd_mode = 1;

//用户注册后获得的邀请码最低最高
//都设置为0用户就不能邀请
$user_invite_min = '3';
$user_invite_max = '3';


//
//选择邮件服务
//mail-gun
//mail-smtp
$Selectmailservice = "mail-smtp";
//邮件发件人
$sender = "i@domain.com";

//mail-gun
// Get your key from https://mailgun.com
$mailgun_key = "";
$mailgun_domain = "";


//
//mail-smtp
//
//需要的php扩展：sockets、Fileinfo和openssl
//设置smtp服务器连接方式:  
//加密连接(ssl) = "1"
//普通连接 = "0"
$mail_smtp_Connection = "1";
//smtp服务器端口 25 , 465 ...
$mail_smtp_Port = 465;
//smtp服务器
$mail_smtp_Server = "smtp.domain.com";
//邮件帐号
$mail_smtp_Account = "i@domain.com";
//邮件密码
$mail_smtp_password = "asswecan";

//引入smarty配置
require_once 'smarty.inc.php';
$smarty->caching=false;
//
require_once 'do.php';
//在smarty全局传递$site_name，$site_url，$version，$Runtime。
$smarty->assign('site_name',$site_name);
$smarty->assign('site_url',$site_url);
$smarty->assign('version',$version." + smarty-Edition");
$smarty->assign('Runtime',$Runtime);
