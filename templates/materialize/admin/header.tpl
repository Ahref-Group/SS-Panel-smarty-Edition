<body class="page-brand">
	<header class="header header-purple header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg text-white">menu</span>
				</a>
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
						<a class="padding-right-lg waves-attach" href="index.php"><i class="icon icon-lg">perm_identity</i>&nbsp;管理中心</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="logout.php"><i class="icon icon-lg">exit_to_app</i>&nbsp;退出</a>
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
					<i class="icon icon-lg">send</i>&nbsp;<{$site_name}>
				</a>
				<ul class="nav">
					<li>
						<a class="waves-attach" href="index.php">管理中心</a>
					</li>
					<li>
						<a class="waves-attach" href="node.php">管理节点</a>
					</li>
					<li>
						<a class="waves-attach" href="user.php">管理用户</a>
					</li>
					<li>
						<a class="waves-attach" href="ip_list.php">查看登录IP</a>
					</li>
					<li>
						<a class="waves-attach" href="plan.php">管理计划</a>
					</li>
					<li>
						<a class="waves-attach" href="code.php">生成兑换码</a>
					</li>
					<li>
						<a class="waves-attach" href="invite.php">邀请码发放</a>
					</li>
					<li>
					<a class="collapsed waves-attach" data-toggle="collapse" href="#change_anc">公告管理</a>
					<ul class="menu-collapse collapse" id="change_anc">
						<{foreach $notice->get_notice_list() as $row}>
							<li>
								<a class="waves-attach" href="notice.php?item=<{$row['item']}>"><{$row['introduction']}></a>
							</li>
						<{/foreach}>
						<li>
							<a class="waves-attach" href="notice.php">添加公告</a>
						</li>
					</ul>
				</ul>
			</div>
		</div>
	</nav>
