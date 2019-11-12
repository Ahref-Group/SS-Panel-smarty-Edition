<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>ログイン -<{$site_name}></title>
<{include file='header.tpl'}>
	<div class="content-header ui-content-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					    <link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
						<h1 class="content-heading" style="font-family: Orbitron;"><{$site_name}></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
				<section class="content-inner margin-top-no">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<h1 class="card-heading"><i class="icon icon-lg">verified_user</i>&nbsp;ログイン</h1>
							</div>
						</div>
					</div>
					<section class="content-inner">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p class="text-center">
										<span class="avatar avatar-inline avatar-lg">
											<img alt="Login" src="https://secure.gravatar.com/avatar/253c7d9e9039f0d2b61615ea280ecb3e?s=80&d=mm&r=g">
										</span>
									</p>
									<form action="javascript:void(0);"  method="POST">
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<input id="email" type="email" name="email" class="form-control" maxlength="30">
													<label for="email" class="floating-label"><i class="icon icon-lg">send</i>&nbsp;メール Email</label>
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<input id="password" type="password" name="password" class="form-control">
													<label for="password" class="floating-label"><i class="icon icon-lg">visibility_off</i>&nbsp;パスワード Password</label>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<div class="checkbox checkbox-adv">
														<div id="assp"></div>
														<label for="remember_me">
															<input class="access-hide" value="week" id="remember_me" name="remember_me" type="checkbox"><i class="icon icon-lg">done_all</i>&nbsp;Cookies
															<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
														</label>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button id="login" type="submit" class="btn btn-block btn-brand waves-attach waves-light"><i class="icon icon-lg">vpn_key</i>&nbsp;ログイン</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-flat btn-brand waves-attach" href="resetpwd.php">パスワードを忘れます</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand waves-attach" href="register.php">アカウントを作成</a></p>
						</div>
					</section>
				</section>
			</div>
		</div>
	</div>
	<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-inner">
					<{include file="loading.tpl"}>
					<div class="text-center">
						<h1 class="h1 margin-top-sm text-black-hint" id="msg"></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
<script type="text/javascript">
    _Prompt_msg();
    function removeHTMLTag(str) {
        str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
        str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
	    str = str.replace(/&nbsp;/ig,'');//去掉&nbsp;
	    return str;
    }
</script>
<script type="text/javascript">
    $(document).ready(function(){
        function login(){
            $("#result").modal();
            $("#loading").show();
            $.ajax({
                type:"POST",
                url:"../user/_login.php",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: Aes.Ctr.encrypt($("#password").val(), "<{$randomChar}>", 256),
                    remember_me: document.getElementById("remember_me").checked ? "week" : "no"
                },
                success:function(data){
                    $("#loading").hide();
                    if(data.ok){
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='../user'", 2000);
                    }else{
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#msg-error-p").html("エーラ："+jqXHR.status);
                    $("#loading").hide();
                    // 在控制台输出错误信息
                    console.log(removeHTMLTag(jqXHR.responseText));
                }
            });
            inemail=$("#email").val();
            inpasswd=$("#password").val();
        }
                
        function logincheck()
            {
                var msg_id=0,msgcss="error";
                if($("#email").val().length==0){
                    id_name="#email";
                    $("#msg").html("メールを入力してください");
                    msg_id=1;
                    return false;
                }
                var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                if(!email_reg.test($("#email").val())) {
                    id_name="#email";
                    $("#msg").html("有効なメールを入力してください！");
                    msg_id=1;
                    return false;
                }
                if($("#password").val().length==0){
                    id_name="#password";
                    $("#msg").html("パスワードを入力してください！");
                    msg_id=1;
                    return false;
                }
                if($("#msg-success-p").eq(0)[0].innerHTML=="ようこそ"|| $("#msg-success-p").eq(0)[0].innerHTML=="ようこそ！"){
                    msg_out("ようこそ！","success");
                    msg_id=1;
                    $("#msg-error-p").html(null);
                }
                if($("#msg-error-p").eq(0)[0].innerHTML=="対応するアカウントがありません。"|| $("#msg-error-p").eq(0)[0].innerHTML=="対応するアカウントがありません。"){
                    if($("#password").val()==inpasswd && $("#email").val()==inemail){
                        id_name="#password";
                        msg_out("対応するアカウントがありません。","error");
                        msg_id=1;
                        return false;
                    }
                }
                if(msg_id==0){
                    login();
                }
            }
            $("html").keydown(function(event){
                if(event.keyCode==13){
                    logincheck();
                    return false;
                }
                if(event.keyCode==27){
                    error_close();
                }
            });
            $("#login").click(function(){
                logincheck();
                $("#msg").html("");
            });
        })
</script>
