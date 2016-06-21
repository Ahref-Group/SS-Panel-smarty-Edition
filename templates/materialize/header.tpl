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
		<a class="header-logo margin-left-no" href="index.php" style="font-family: Orbitron;"><{$site_name}></a>
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				    <p></p>
					<span class="access-hide">User Head</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="https://avatar.duoshuo.com/avatar-50/760/144058.jpg"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/user"><i class="icon icon-lg">account_circle</i>&nbsp;用戶中心</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/user/register.php"><i class="icon icon-lg">add</i>&nbsp;註冊<{$site_name}></a>
					</li>
				</ul>
			</li>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
			<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
				<a class="menu-logo" href="index.php" style="font-family: Orbitron;"><{$site_name}></a>
				<ul class="nav">
					<li>
						<a class="waves-attach" href="/index.php">首頁</a>
					</li>
					<li>
						<a class="waves-attach" href="/user">登入</a>
					</li>
					<li>
						<a class="waves-attach" href="/auth/register.php">註冊</a>
					</li>
		    		<li>
						<a class="waves-attach" href="/tos.php">用戶協議</a>
					</li>
					<li>
						<a class="waves-attach" href="/code.php">邀請碼</a>
					</li>
					<li>
						<a class="waves-attach" href="/admin/">管理員入口</a>
					</li>
				</ul>
				<ul class="menu-collapse collapse" id="more">
					<a class="collapsed waves-attach" data-toggle="collapse" href="#more">更多</a>
					<li>
						<a class="waves-attach" href="mailto:vonss2016@outlook.com">發送反饋</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>