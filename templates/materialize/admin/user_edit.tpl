<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>编辑用户 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">编辑用户&nbsp<small>Edit User</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在修改用户 <{$rs['user_name']}> 的资料。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<form role="form" method="post" action="javascript:void(0);">
									<div class="col-lg-6 col-md-12 col-sm-12">
										<p class="card-heading">ID: <{$uid}> 的用户信息</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_name">用户名</label>
											<input class="form-control" id="user_name" type="text" value="<{$rs['user_name']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_email">用户邮箱</label>
											<input class="form-control" id="user_email" type="text" value="<{$rs['email']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_pass">用户密码 新密码(不修改请留空)</label>
											<input class="form-control" id="user_pass" type="text">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_passwd">连接密码</label>
											<input class="form-control" id="user_passwd" type="text" value="<{$rs['passwd']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_protocol">协议</label>
											<input class="form-control" id="user_protocol" type="text" value="<{$rs['protocol']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_obfs">混淆</label>
											<input class="form-control" id="user_obfs" type="text" value="<{$rs['obfs']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="user_method">加密</label>
											<input class="form-control" id="user_method" type="text" value="<{$rs['method']}>">
										</div>
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12">
										<div class="form-group form-group-label">
											<label class="floating-label" for="transfer_enable">设置流量，单位为GB</label>
											<input class="form-control" id="transfer_enable" type="text" value="<{\Ss\Etc\Comm::flowAutoShow($rs['transfer_enable'])}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="invite_num">邀请码数量</label>
											<input class="form-control" id="invite_num" type="text" value="<{$rs['invite_num']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan">套餐类别</label>
											<input class="form-control" id="plan" type="text" value="<{$rs['plan']}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan_end_time">套餐到期时间</label>
											<input class="form-control" id="plan_end_time" type="text"  onclick="$('#plan_end_time').pickdate();" value="<{date('Y-m-d',$rs['plan_end_time'])}>">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="message">用戶独立通知</label>
											<textarea class="form-control textarea-autosize" id="message" type="text" ><{$rs['message']}></textarea>
										</div>
										<div class="checkbox switch">
											<label for="enable">停止/
												<input class="access-hide" id="enable" name="enable" type="checkbox"<{if $rs['enable']==1}> checked="checked" <{/if}>  ><span class="switch-toggle"></span>
												正常
											</label>
										</div><br/>
									</div>
									<button class="btn btn-block btn-brand waves-attach waves-light" id="Submit" type="submit">修改</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
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
	</main>
</body>
<script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
<script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
<script type="text/javascript">
function get_unix_time(dateStr)
{
date = new Date(Date.parse(dateStr.replace(/-/g, "/")));
date = date.getTime();
return parseInt(date/1000);
}
$(document).ready(function(){
    $("#Submit").click(function(){
        $('#result').modal();
        $('#loading').show();
        $.ajax({
            type:"POST",
            url:"_user_edit.php",
            dataType:"json",
            data:{
                user_uid: "<{$uid}>",
                user_name: $("#user_name").val(),
                user_email: $("#user_email").val(),
                user_email_hidden: "<{$rs['email']}>",
                user_pass: Aes.Ctr.encrypt($("#user_pass").val(), "<{$randomChar}>", 256),
                user_pass_hidden: "<{$rs['pass']}>",
                user_passwd: Aes.Ctr.encrypt($("#user_passwd").val(), "<{$randomChar}>", 256),
				user_protocol: $("#user_protocol").val(),
				user_obfs: $("#user_obfs").val(),
				user_method: $("#user_method").val(),
				transfer_enable: $("#transfer_enable").val(),
				plan: $("#plan").val(),
                transfer_enable_hidden: "<{\Ss\Etc\Comm::flowAutoShow($rs['transfer_enable'])}>",
                invite_num: $("#invite_num").val(),
                enable: document.getElementById("enable").checked ? "1" : "0",
                plan_end_time: get_unix_time($("#plan_end_time").val()),
		message: $("#message").val()
            },
            success:function(data){
                $('#loading').hide();
                if(data.ok){
                    $("#msg").html(data.msg);
                    window.setTimeout("location.href='user.php'", 1000);
                }else{
                    $("#msg").html(data.msg);
                }
            },
            error:function(jqXHR){
                $('#loading').hide();
                $("#msg").html("发生错误："+jqXHR.status);
                // 在控制台输出错误信息
                console.log(removeHTMLTag(jqXHR.responseText));
            }
        })
    })
})
</script>
<script>
    $('#plan_end_time').pickdate({
    cancel: '取消',
    closeOnCancel: false,
    closeOnSelect: false,
    container: '',
    firstDay: 1,
    format: 'yyyy-mm-dd', // escape any formatting characters with an exclamation mark
    formatSubmit: 'yyyy-mm-dd',
    ok: '确认',
    selectMonths: true,
    selectYears: 5,
    today: '今天'
});
</script>
