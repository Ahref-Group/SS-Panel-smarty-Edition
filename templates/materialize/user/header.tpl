<body class="page-brand">
	<header class="header header-purple header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu"><span class="icon icon-lg text-white">menu</span></a>
			</div>
		</ul>
		<ul class="nav nav-list pull-right">
			<div class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
					<p></p>
					<span class="access-hide"></span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="<{$Gravatar_Email_img}>"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/user/"><i class="icon icon-lg">account_circle</i>&nbsp;用户中心</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/user/logout.php"><i class="icon icon-lg">exit_to_app</i>&nbsp;退出</a>
					</li>
				</ul>
			</div>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" class="header-logo margin-left-no" href="index.php" style="font-family: Orbitron;">
					<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
					<i class="icon icon-lg">send</i>&nbsp;<{$site_name}></a>
				<ul class="nav">
					<li>
						<a href="/user/"><i class="icon icon-lg">recent_actors</i>&nbsp;用户中心</a>
					</li>
					<li>
						<a href="node.php"><i class="icon icon-lg">router</i>&nbsp;节点列表</a>
					</li>
					<li>
					    <a href="shop.php"><i class="icon icon-lg">shop</i>&nbsp;商店</a>
					</li>
					<li>
					    <a href="miao.php"><i class="icon icon-lg">pets</i>&nbsp;喵币充值</a>
					</li>
					<li>
						<a href="code.php"><i class="icon icon-lg">card_giftcard</i>&nbsp;兑换</a>
					</li>
					<!--<li>-->
					<!-- <a href="shop_re.php">-->
					<!-- <i class="icon icon-lg">router</i>&nbsp;购买记录-->
					<!-- </a>-->
					<!--</li>-->
					<li>
						<a href="my.php"><i class="icon icon-lg">account_circle</i>&nbsp;我的信息</a>
					</li>
					<li>
						<a href="update.php"><i class="icon icon-lg">sync_problem</i>&nbsp;修改资料</a>
					</li>
					<li>
						<a href="invite.php"><i class="icon icon-lg">loyalty</i>&nbsp;邀请好友</a>
					</li>
					<li>
					    <a href="user_ip.php"><i class="icon icon-lg">security</i>&nbsp;登录历史</a>
					</li>
					<li>
						<a href="sys.php"><i class="icon icon-lg">info</i>&nbsp;系统信息</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<div aria-hidden="true" class="modal modal-va-middle fade" id="pop_up" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-inner text-center">
				    <h3>全局通知</h3>
				    <p id="pop_msg"><{$notice->notice('pop_up')}></p>
				</div>
					
				<div class="modal-footer">
					<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" id="disable" data-dismiss="modal" type="button">不再提示</button><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">我知道了</button></p>
				</div>
			</div>
		</div>
	</div>
	<!--script>
	    var msg = $('#pop_msg').html;
	    if(msg.length != 0) $('#pop_up').modal();
	    $("#disable").click(function(){
	        var expdate = new Date();
	        expdate.setTime(expdate.getTime() + 7 * 24 * 60 * 60 * 1000);
	        document.cookie = "msg" + "=" + msg + ";expires="+expdate.toGMTString()+";path=/";
	   });
	</script-->
