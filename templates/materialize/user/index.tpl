<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>用户中心 -<{$site_name}></title>
<style>
    .info{
            color: #ff4081;
        }
    .info:hover{
        color:white;
    }
</style>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心&nbsp;<small>User Center</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p><{$GetUserName}>，您好 :-),欢迎来到<{$site_name}></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-12">
				    <{if $oo->get_message()==''}>
					<{else}>
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner">
										<div class="text-center">
											<p class="card-heading"><i class="icon icon-lg">chat</i>&nbsp;<{$GetUserName}>的通知</p>
										</div>
										<{$oo->get_message()}>
									</div>
								</div>
							</div>
						</div>
                    <{/if}>
					<div class="col-lg-12 col-sm-12">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<div class="text-center">
										<p class="card-heading"><i class="icon icon-lg">error_outline</i>&nbsp;公告</p>
									</div>
									<{$notice->notice('user_home')}>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-sm-12">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<{if $oo->get_enable()==1}>
										<div class="card-inner">
											<{if $plan_type=='A' || $plan_type =='B' || $plan_type == 'D'}>
												<div class="text-center">
													<p class="card-heading"><i class="icon icon-lg">check</i>&nbsp;签到</p>
												</div>
												<p>今天，你签到了么？</p>
												<p>签到可领取一定量的流量，免费用户还能延长你的账户寿命哦~</p>
												<{if $oo->is_able_to_check_in()}>
													<p id="checkin-btn">
														<button id="checkin" class="btn btn-brand-accent waves-attach waves-light">嗨，该搬砖了！</button>
													</p>
													<{include file='loading.tpl'}>
												<{/if}>
												<p id="checkin-msg"></p>
												<p>上次签到时间:<span class="label label-brand-accent margin-right"><{date( 'Y-m-d H:i:s',$oo->get_last_check_in_time())}></span></p>
												<{if $plan_type == 'A'}>
													<abbr title="对于免费用户，你至少7天要签到一次，否则你的账号将被停用。签到可以自动续期">签到会自动延长时间，过期了就会被停用哦！</abbr>
												<{/if}>
											<{else}>
												<div class="text-center">
													<p class="card-heading"><i class="icon icon-lg">check</i>&nbsp;续费&充值</p>
												</div>
												<p>剩余喵币：<{$get_money}>个</p>
												<p>你是包月用户，无需签到哦,套餐到期请记得续费~</p>
											<{/if}>
										</div>
									<{else}>
										<div class="text-center">
											<p class="card-heading"><i class="icon icon-lg">error</i>&nbsp;错误</p>
										</div>
										<div class="card-inner">
											<p>您的账户未开通<br>无法签到获取流量</p>
											<p><a class="btn btn-red waves-attach waves-light waves-effect" href="#!">禁止签到</a></p>
											<p id="checkin-msg"></p>
											<p>未检测到签到信息！</p>
										</div>
									<{/if}>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-12">
					<div class="col-lg-12 col-sm-12">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<div class="text-center">
										<{if $plan_type=='A' || $plan_type =='B' || $plan_type == 'D' }>
											<p class="card-heading"><i class="icon icon-lg">dashboard</i>&nbsp;账户流量信息</p>
											<p>已用流量:<{$transfers|default:0}> MB &nbsp; <span class="new badge hoverable">(<{$used_100|default:50}>%)</span></p>
											<div class="progress z-depth-1">
												<div class="progress-bar" style="width:<{$used_100|default:50}>%"></div>
											</div>
											<p>可用流量:<{$all_transfer|default:0}> GB | 剩余流量:<{$unused_transfer|default:0}> GB</p>
										<{else}>
											<p class="card-heading"><i class="icon icon-lg">dashboard</i>&nbsp;付费账户信息</p>
											<p>已用流量:<{$transfers|default:0}> MB<p>
											<p>到期时间<span class="label label-brand-accent margin-right"><{date( 'Y-m-d H:i:s',$oo->get_plan_end_time())}></span></p>
											<p>您是不限流量用户，不需担心流量的问题！</p>
										<{/if}>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-sm-12">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<div class="text-center">
										<p class="card-heading"><i class="icon icon-lg">info</i>&nbsp;账户信息</p>
									</div>
									<{if $oo->get_enable()==1}>
										<p>打死也不能让别人知道哦 >_<</p>
										<p>状态:正常</p>
										<p>
											<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#Hiden">
												<span class="collapsed-show">鼠标放在下方显示端口&密码</span>
											</a>
											<div style="font-size:20px">
												<p>端口:<span class="label label-brand-accent margin-right info"><{$oo->get_port()}></span></p>
												<p>密码:<span class="label label-brand-accent margin-right info"><{$oo->get_pass()}></span></p>
												<p>协议:<span class="label label-brand-accent margin-right info"><{$oo->get_protocol()}></span></p>
												<p>混淆:<span class="label label-brand-accent margin-right info"><{$oo->get_obfs()}></span></p>
												<p>算法:<span class="label label-brand-accent margin-right info"><{$oo->get_method()}></span></p>
											</div>
										</p>
										<{if $oo->get_plan()==A}>
											<p>套餐:<span class="label label-brand-accent margin-right">免费用户</span></p>
										<{else}>
											<p>套餐:<span class="label label-brand-accent margin-right">付费<{$plan_type}>套餐</span></p>
										<{/if}>
										<p>最后使用时间:<span class="label label-brand-accent margin-right"><{date( 'Y-m-d H:i:s',$unix_time)}></span></p>
										<{if $oo->get_plan()==A}>
											<p>用户暂停时间:<span class="label label-brand-accent margin-right"><{date( 'Y-m-d H:i:s',$oo->get_plan_end_time())}></span></p>
										<{else if $oo->get_plan()==E ||$oo->get_plan()==C}>
											<p>套餐到期时间:<span class="label label-brand-accent margin-right"><{date( 'Y-m-d H:i:s',$oo->get_plan_end_time())}></span></p>
										<{/if}>
									<{else}>
										<{if $oo->get_enable()==0}>
											<p>状态:停止</p>
											<p>您的帐户由于服务到期或尚未开通被停止服务，请在商店付费购买服务。</p>
										<{else}>
                                          	<p>状态:封禁</p>
										    <p>您的帐户由于滥用或其他原因被封禁，请联系管理员。</p>
										<{/if}>
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
<{include file='../footer.tpl'}>
<script type="text/javascript">
    $(document).ready(function(){
        $("#checkin").click(function(){
            $("#loading").show();
            $.ajax({
                type:"GET",
                url:"_checkin.php",
                dataType:"json",
                success:function(data){
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                    $("#loading").hide();
                },
                error:function(jqXHR){
                    alert("发生错误:"+jqXHR.status);
                }
            })
        })
    })
</script>
</html>
