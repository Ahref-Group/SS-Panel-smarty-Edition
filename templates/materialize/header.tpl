<body class="page-brand">
	<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
		<a class="header-logo margin-left-no" href="/index.php" style="font-family: Orbitron;"><{$site_name}></a>
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				    <p></p>
					<span class="access-hide">User Head</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="https://avatar.duoshuo.com/avatar-50/760/144058.jpg"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/user"><i class="icon icon-lg">account_circle</i>&nbsp;用户中心</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/auth/register.php"><i class="icon icon-lg">add</i>&nbsp;注册<{$site_name}></a>
					</li>
				</ul>
			</li>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="/index.php" style="font-family: Orbitron;"><{$site_name}></a>
				<ul class="nav">
					<li>
						<a class="waves-attach" href="/index.php">首页</a>
					</li>
					<li>
						<a class="waves-attach" href="/user">登录</a>
					</li>
					<li>
						<a class="waves-attach" href="/auth/register.php">注册</a>
					</li>
					<li>
						<a class="waves-attach" href="/tos.php">用户协议</a>
					</li>
					<li>
						<a class="waves-attach" href="/code.php">邀请码</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
