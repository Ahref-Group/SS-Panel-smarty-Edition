<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>アカウントを作成 - <{$site_name}></title>
<{include file='header.tpl'}>
<script type="text/javascript">
    function agree_yes(){
        document.getElementById("agree").checked=true
    }
    function agree_no(){
        document.getElementById("agree").checked=false
    }
</script>
</head>
<body class="page-brand">
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
                                			<h1 class="card-heading"><i class="icon icon-lg">verified_user</i>&nbsp;アカウントを作成</h1>
						</div>
					</div>
				</div><!--card-->
				<section class="content-inner">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<form action="javascript:void(0);"  method="POST">
									<div class="form-group form-group-label">
										<div class="row">
                                                					<div class="col-md-10 col-md-push-1">
                                                    						<input id="name" type="text" name="name" class="form-control" maxlength="16">
                                                    						<label for="name" class="floating-label"><i class="icon icon-lg">person</i>&nbsp;名前 UserName</label>
                                                					</div>
                                            					</div>
                                        				</div>
                                        				<div class="form-group form-group-label">
										<div class="row">
                                                					<div class="col-md-10 col-md-push-1">
												<input id="email" type="email" name="email" class="form-control" maxlength="30">
												<label for="email"  class="floating-label"><i class="icon icon-lg">send</i>&nbsp;メール Email</label>
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<input id="password" type="password" name="password" class="form-control" maxlength="18">
												<label for="password"  class="floating-label"><i class="icon icon-lg">visibility_off</i>&nbsp;パスワード PassWord</label>
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<input id="repassword" type="password" name="repassword" class="form-control" maxlength="18">
												<label for="repassword"  class="floating-label"><i class="icon icon-lg">redo</i>&nbsp;もう一回 RePassWord</label>
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<input id="code" type="text" name="code" class="form-control" maxlength="50">
												<label for="code"  class="floating-label"><i class="icon icon-lg">pets</i>&nbsp;招待コード Code</label>
											</div>
										</div>
									</div>
									<div class="form-group">
									        <div class="row">
											<div class="col-md-10 col-md-push-1">
												<div class="checkbox checkbox-adv">
													<label for="agree">
														<input class="access-hide" id="agree" name="agree" type="checkbox" onclick="$('#tos').modal();"><i class="icon icon-lg">pan_tool</i>&nbsp;利用规约
														<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
									        <div class="row">
											<div class="col-md-10 col-md-push-1">
												<button class="btn btn-block btn-brand waves-attach waves-light" data-toggle="modal" id="registrace"><i class="icon icon-lg">flight</i>&nbsp;作成</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div><!--card-main-->
					</div>
				</section><!--content-inner-->
			</section>
		</div><!--col…-->
	</div><!--row-->
	</div><!--container-->

	<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-inner">
					<{include file="../user/loading.tpl"}>
				        <h4 class="h1 margin-top-sm text-black-hint" id="msg"></h4>
				</div>
			</div>
		</div>
	</div><!--modal-loading-->
	<div aria-hidden="true" class="modal modal-va-middle fade" id="tos" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="text-center">
					<div class="modal-heading">
						<p class="modal-title"><{$site_name}>利用规约<small>Terms of Service</small></p>
					</div>
				<div class="modal-inner">
					<p class="h5 margin-top-sm text-black-hint"><{$tos_content}></p>
				</div>
				<div class="modal-footer">
					<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" onclick="agree_no()">拒否する</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" onclick="agree_yes()">同意する</a></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
    <script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
    <!-- AES -->
    <script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
    <script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
    <script type="text/javascript">
        _Prompt_msg();
        // 过滤HTML标签以及&nbsp 来自：http://www.cnblogs.com/liszt/archive/2011/08/16/2140007.html
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
            function register(){
                $("#result").modal();
                $("#loading").show();
                $.ajax({
                    type:"POST",
                    url:"../user/_reg.php",
                    dataType:"json",
                    data:{
                        email: $("#email").val(),
                        name: $("#name").val(),
                        passwd: Aes.Ctr.encrypt($("#password").val(), "<{$randomChar}>", 256),
                        repasswd: Aes.Ctr.encrypt($("#repassword").val(), "<{$randomChar}>", 256),
                        code: $("#code").val(),
                        agree: document.getElementById("agree").checked ? "week" : "no"
                    },
                    success:function(data){
                        if(data.ok){
                            $("#result").modal();
                            $("#msg").html(data.msg);
                            $("#loading").hide();
                            window.setTimeout("location.href='login.php'", 2000);
                        }else{
                            $("#result").modal();
                            $("#loading").hide();
                            $("#msg").html(data.msg);
                            }
                    },
                    error:function(jqXHR){
                        $("#msg").html("エラー："+jqXHR.status);
                        $("#result").modal();
                        $("#loading").hide();
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                    }
                });
                incode=$("#code").val();
            }
            function registercheck(){
                var msg_id=0;
                    if($("#name").val().length==0){
                        id_name="#name";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("君の名は？");
                        msg_id=1;
                        return false;
                    }
                    if(($("#name").val()).length<7){
                        id_name="#name";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("長い");
                        msg_id=1;
                        return false;
                    }
                    if($("#email").val().length==0){
                        id_name="#email";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("メールは？");
                        msg_id=1;
                        return false;
                    }
                    var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                    if(!email_reg.test($("#email").val())) {
                        id_name="#email";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("これはメールじゃない");
                        msg_id=1;
                        return false;
                    }
                    if($("#password").val().length==0){
                        id_name="#password";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("パスワードは？");
                        msg_id=1;
                        return false;
                    }
                    if(($("#password").val()).length<8){
                        id_name="#password";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("パスワードはちょっと長いです");
                        msg_id=1;
                        return false;
                    }
                    if($("#repassword").val().length==0){
                        id_name="#repassword";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("もう一回");
                        msg_id=1;
                        return false;
                    }
                    if($("#password").val() != $("#repassword").val()){
                        id_name="#repassword";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("パスワードは異になります");
                        msg_id=1;
                        return false;
                    }
                    if($("#code").val().length==0){
                        id_name="#code";
                        $("#result").modal();
                        $("#loading").hide();
                        $("#msg").html("招待コードは？");
                        msg_id=1;
                        return false;
                    }
                    if($("#msg-success-p").eq(0)[0].innerHTML=="注册成功"){
                        msg_out("ようこそ","success");
                        $("#loading").hide();
                        msg_id=1;
                        $("#msg-error-p").html(null);
                    }
                    if($("#msg-error-p").eq(0)[0].innerHTML=="招待コードは無效です"|| $("#msg-error-p").eq(0)[0].innerHTML=="邀请码无效，请重新输入！"){
                        $("#loading").hide();
                        if($("#code").val()==incode){
                            id_name="#code";
                            $("#loading").hide();
                            msg_out("招待コードは無效です","error");
                            msg_id=1;
                            return false;
                        }
                    }
                    if(msg_id==0){
                        if(document.getElementById("agree").checked===false){
                        id_name="#agree";
                        $("#loading").hide();
                        $("#tos").modal();
                        msg_id=1;
                        return false;
                    }
                    else
                        register();
                    }
                }
                $("#registrace").click(function(){
                    registercheck();
                });
                $("#ok-close").click(function(){
                    $("#msg-success").modal();
                });
                $("#msg-error").click(function(){
                    error_close();
                });
                function error_close(){
                    if($("#msg-error").css('display')=="none"){
                        $("#msg-error").modal();
                        $(id_name).focus();
                        if(id_name=="#email"){
                            $(id_name).select();
                        }
                    }
                }
            }
        )
        </script>

