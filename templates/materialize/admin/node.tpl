<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>节点列表 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
</head>
<body>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点管理&nbsp<small>Edit Nodes</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在管理 <{$site_name}> 的节点信息。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">节点概览</p>
								<div class="table-responsive">
									<table class="table" title="Node List">
										<thead>
											<tr>
												<th>ID</th>
												<th>节点</th>
												<th>加密</th>
												<th>描述</th>
												<th>协议(SSR特性)</th>
												<th>混淆(SSR特性)</th>
												<th>参数(SSR特性)</th>
												<th>排序</th>
												<th>操作</th>
											</tr>
										</thead>
										<{foreach $node as $rs}>
											<tr>
												<td><{$rs['id']}></td>
												<td><{$rs['node_name']}></td>
												<td><{$rs['node_method']}></td>
												<td><{$rs['node_info']}></td>
												<td><{$rs['protocol']}></td>
												<td><{$rs['obfs']}></td>
												<td><{$rs['parameter']}></td>
												<td><{$rs['node_order']}></td>
												<td>
													<a class="btn btn-brand waves-attach waves-light" href="node_edit.php?id=<{$rs['id']}>">编辑</a>
													<a class="btn btn-red waves-attach waves-light" href="node_del.php?id=<{$rs['id']}>" onclick="JavaScript:return confirm('确定删除吗？')">删除</a>
												</td>
											</tr>
										<{/foreach}>
									</table> 
								</div>
								<div class="col-md-12">
									<a href="node_add.php" class="btn btn-block btn-brand waves-attach waves-light">添加节点</a>
								</div><br/>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
<{include file="footer.tpl"}>
</html>

