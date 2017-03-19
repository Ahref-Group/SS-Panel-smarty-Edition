<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>邀请 -<{$site_name}></title>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">邀请好友&nbsp;<small>Invite</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
			    <div class="row">
			        <div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p><{$GetUserName}>，您好 :-),<{$site_name}>欢迎您邀请他人加入。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="ui-card-wrap">
						<div class="card card-brand">
							<div class="card-main">
								<div class="card-inner margin-bottom-no">
									<p class="card-heading">邀请码申请</p>
									<div class="card-table">
										<p>哇~你有<code><{$InviteNum}></code>个喵星人耶( •̀ ω •́ )y  </p>
										<{if $InviteNum !=0}>
											<button id="invite" class="btn btn-brand-accent waves-attach"><i class="icon icon-lg">near_me</i>&nbsp;我要生喵！</button>
											<br/><br/>
										<{/if}>
										<{include file='loading.tpl'}>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui-card-wrap">
						<div class="card card-brand-accent">
							<div class="card-main">
								<div class="card-inner margin-bottom-no">
									<p class="card-heading"><i class="icon icon-lg">info</i>&nbsp;注意事项</p>
									<div class="card-table"><{$notice->notice('user_invite')}></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="card">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
								<p class="card-heading"><i class="icon icon-lg">adb</i>&nbsp;我的喵星人</p>
								<div class="card-inner">
								    <{if $oo->get_enable()==1}>
										<{if count($code)!=null}>
											<div class="table-responsive">
												<table class="table" title="Code">
													<thead>
														<tr>
															<th>###</th>
															<th>邀请码</th>
														</tr>
													</thead>
													<tbody>
														<{foreach $code as $data}>
															<tr>
																<td><{$a++}></td>
																<td><{$data['code']}></td>
															</tr>
														<{/foreach}>
													</tbody>
												</table> 
											</div>
										<{else}>
											<div class="card-table">
												<p>唔，您暂时没有喵星人 (>_<)</p>
											</div>
										<{/if}>
									<{else}>
									    <div class="table-responsive">
												<table class="table" title="Code">
													<p class="text-center">您的账号已经被停止，无法查看邀请码.</p>
												</table> 
											</div>
									<{/if}>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
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
<{include file='../footer.tpl'}>
<script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
<script type="text/javascript">
  _Prompt_msg();
</script>
<script>
    $(document).ready(function(){
        $("#invite").click(function(){
            $("#loading").show();
            $("#invite").hide();
            $.ajax({
                type:"GET",
                url:"_invite.php",
                dataType:"json",
                success:function(data){
                    if(data.ok){
                        $("#loading").hide();
                        window.location.reload();
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#result").modal();
                    $("#msg").html("发生错误："+jqXHR.status);
                }
            })
        })
    })
</script>
