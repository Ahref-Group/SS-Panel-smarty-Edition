<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>找回密码 - <{$site_name}></title>
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
				<section class="content-inner marin-top-no">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<h1 class="card-heading"><i class="icon icon-lg">error</i>&nbsp;找回密码</h1>
							</div>
						</div>
					</div>
				</section>
				<section class="content-inner">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="text-center">
									<span class="avatar avatar-inline avatar-lg">
										<img alt="Login" src="https://secure.gravatar.com/avatar/253c7d9e9039f0d2b61615ea280ecb3e?s=80&d=mm&r=g">
									</span>
								</p>
								<form action="javascript:void(0);" autocomplete="off" method="POST">
									<div class="form-group form-group-label">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<input id="email" type="email" name="email" class="form-control" maxlength="30">
												<label for="email" class="floating-label"><i class="icon icon-lg">send</i>&nbsp;邮箱 Email</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-10 col-md-push-1">
												<button id="reset" type="submit" class="btn btn-block btn-brand waves-attach waves-light"><i class="icon icon-lg">redo</i>&nbsp;找回</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-inner">
					<div class="text-center">
						<{include file="../user/loading.tpl"}>
						<h1 class="h1 margin-top-sm text-black-hint" id="msg"></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
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
            function reset(){
                    $("#loading").show();
                    $("#result").modal();
                       $.ajax({
                        type:"GET",
                        url:"_resetpwd.php?username="+$("#username").val()+"&email="+$("#email").val(),
                        dataType:"json",
                        success:function(data){
                            $("#loading").hide();
                            if(data.ok){
                                $("#msg").html(data.msg);
                                window.setTimeout("location.href='index.php'", 2000);
                            }else{
                                $("#msg").html(data.msg);
                            }
                        },
                        error:function(jqXHR){
                                $("#msg").html("发生错误："+jqXHR.status);
                                $("#loading").hide();
                                // 在控制台输出错误信息
                                console.log(removeHTMLTag(jqXHR.responseText));
                        }
                    });
                    
                    inpemail=$("#email").val();
                }
                function resetcheck(){
                            var msg_id=0;
                            $("#loading").hide();
                            $("#result").modal();
                            $("#msg").html("");
                            if($("#email").val().length==0){
                                id_name="#email";
                                
                                $("#msg").html("请输入邮箱");
                                msg_id=1;
                                return false;
                            }
                            var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                            if(!email_reg.test($("#email").val())) {
                                id_name="#email";
                                $("#msg").html("请输入有效的邮箱！");
                                msg_id=1;
                                return false;
                            }
                            if($("#msg-success-p").eq(0)[0].innerHTML=="已经发送到邮箱"){
                                $("#msg").html("已经发送到邮箱");
                                msg_id=1;
                                $("#msg-error-p").html(null);
                             }
                            if($("#msg-error-p").eq(0)[0].innerHTML=="邮箱不存在" 
                            || $("#msg-error-p").eq(0)[0].innerHTML=="邮箱不存在，请重新输入！"){
                                 if($("#email").val()==inpemail){
                                    id_name="#email";
                                    $("#msg").html("邮箱不存在，请重新输入！");
                                    msg_id=1;
                                    return false;
                                    }
                            }
                            if(msg_id==0){ 
                                    reset();
                            }
                }
                function msg_out(msgout,msgcss){            
                            $('.lean-overlay').remove();
                            Materialize.toast(msgout, 3000, 'rounded')
                            $(id_name).focus();
                            // $("#msg-"+msgcss).openModal();
                            $("#msg-"+msgcss+"-p").html(msgout);
                            error_close();
                }
                $("html").keydown(function(event){
                    if(event.keyCode==13){
                        resetcheck();
                        return false;
                    }
                    if(event.keyCode==27){
                        error_close();
                    }
                });
                $("#reset").click(function(){
                    resetcheck();
                });
                $("#ok-close").click(function(){
                    $("#result").modal();
                });
                $("#msg-error").click(function(){
                    error_close();
                });
                function error_close(){
                    if($("#msg-error").css('display')=="none"){
                        $("#result").modal();
                        $(id_name).focus();
                        if(id_name=="#email"){
                            $(id_name).select();
                        }
                    }
                }
            })
        </script>

