<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>修改个人信息 -<{$site_name}></title>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">修改个人信息&nbsp;<small>Update Information</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p><{$GetUserName}>，您好 :-),您在尝试修改<{$site_name}>的密码</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">修改登录密码</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="nowpwd">输入当前密码</label>
									<input class="form-control" id="nowpwd" type="password" name="nowpwd" maxlength="30" required>
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="pwd">输入新密码</label>
									<input class="form-control" id="pwd" type="password" name="pwd" maxlength="30" required>
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="repwd">输入确认密码</label>
									<input class="form-control" id="repwd" type="password" name="repwd" maxlength="30" required>
								</div>
								<a href="#updatepwd" data-toggle="modal" class="btn btn-block btn-brand-accent waves-attach waves-light">更改</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">修改ShadowSocks连接密码</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="sspwd">输入新的连接密码</label>
									<input class="form-control" id="sspwd" type="password" name="sspwd" maxlength="30" required>
								</div>
								<a href="#updatesspwd" data-toggle="modal" class="btn btn-block btn-brand-accent waves-attach waves-light">更改</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
<div aria-hidden="true" class="modal modal-va-middle fade" id="updatepwd" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">修改登录密码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint"><br>确认修改<{$site_name}>的登录密码？</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">放弃</a><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="pwd-update" type="submit">我确认</button></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="updatesspwd" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
		    <div class="modal-heading">
				<p class="modal-title">修改ShadowSocks连接密码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">确认修改<{$site_name}>的所有节点连接密码？</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">放弃</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="ss-pwd-update" type="submit">我确认</a></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint" id="msg"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">确定</button></p>
			</div>
		</div>
	</div>
</div>
<{include file='footer.tpl'}>
<script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
<script type="text/javascript">
  _Prompt_msg();
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#pwd-update").click(function(){
            $("#updatepwd").hide();
            function msg_out(msgout,msgcss){
                $("#result").modal();
                $("#msg").html(msgout);
            }
            if($("#nowpwd").val().length==0){
                $("#result").modal();
                $("#msg").html("请输入密码")
                msg_id=1;
                return false;
            }
            if($("#pwd").val().length==0){
                 $("#result").modal();
                 $("#msg").html("请输入新密码")
                msg_id=1;
                return false;
            }
            if($("#repwd").val().length==0){
                 $("#result").modal();
                 $("#msg").html("请输入确认密码")
                msg_id=1;
                return false;
            }
            if($("#repwd").val()!=$("#pwd").val()){
                $("#result").modal();
                $("#msg").html("新密码与确认密码不一样，请重新输入。")
                msg_id=1;
                return false;
            }
            $.ajax({
                type:"POST",
                url:"_pwd_update.php",
                dataType:"json",
                data:{
                    nowpwd: Aes.Ctr.encrypt($("#nowpwd").val(), "<{$randomChar}>", 256),
                    pwd: Aes.Ctr.encrypt($("#pwd").val(), "<{$randomChar}>", 256),
                    repwd: Aes.Ctr.encrypt($("#repwd").val(), "<{$randomChar}>", 256)
                },
                success:function(data){
                    if(data.ok){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='../auth/login.php'", 2000);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                        $("#msg").html("发生错误："+jqXHR.status);
                        $("#result").modal();
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                }
            })
        })
    })
</script>
<script>
   $(document).ready(function(){
        $("#ss-pwd-update").click(function(){
            $.ajax({
                type:"POST",
                url:"_sspwd_update.php",
                dataType:"json",
                data:{
                    sspwd: Aes.Ctr.encrypt($("#sspwd").val(), "<{$randomChar}>", 256)
                },
                success:function(data){
                    if(data.ok){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                        $("#msg").html("发生错误："+jqXHR.status);
                        $("#result").modal();
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                }
            })
        })
    })
</script>
