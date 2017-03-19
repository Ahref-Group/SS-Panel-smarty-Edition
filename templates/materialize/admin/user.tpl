<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1, user-scalable=no">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>用户管理 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
<!-- 加载dataTables样式文件 dataTables.bootstrap.css -->
<link href="<{$resources_dir}>/assets/plugins/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
<link href="<{$resources_dir}>/assets/plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<{$resources_dir}>/assets/plugins/datatables/media/css/dataTables.colVis.min.css" rel="stylesheet" type="text/css" />
	<style>
		.btn-sm {
			padding: 0 1rem;
			margin-bottom: 5px;
			background-color: #31B3D6;
		}
		table.dataTable {
			width: 100%;
			margin: 0 auto;
			clear: both;
			border-collapse: separate;
			border-spacing: 0;
		}
		table.dataTable tbody tr {
			background-color: rgba(255, 255, 255, 0);
		}
		table.striped>tbody>tr:nth-child(odd) {
			background-color: rgba(255, 255, 255, 0.31);
		}
		table.hoverable>tbody>tr:hover {
			background-color: rgba(250, 248, 109, 0.86);
		}
		.table_no{  
		white-space:nowrap;  
		}
		@media only screen and (max-width : 1042px) {
		table.dataTable {
			width: 100%;
		}
		table.dataTable tbody td {
			padding: 11px 10px;
		}
		table.dataTable thead > tr > th {
			padding-right: 35px;
		}
	</style>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户管理&nbsp<small>User Edit</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在查看 <{$site_name}> 的用户列表。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="card">
				<div class="card-main">
					<div class="card-inner margin-bottom-no">
						<div class="card-table">
							<div class="table-responsive">
								<table class="table table_no dataTable" id="user" title="User List">
									<thead>
										<tr>
											<th>ID</th>
											<th>用户名</th>
											<th>邮箱</th>
											<th>端口</th>
											<th>套餐</th>
											<th>总流量</th>
											<th>剩余流量</th>
											<th>已用流量</th>
											<th>上传流量</th>
											<th>下载流量</th>
											<th>注册时间</th>
											<th>最后签到</th>
											<th>最近使用</th>
											<th>启用状态</th>
											<th>封禁状态</th>
											<th>邀请人</th>
											<th>邀请码</th>
											<th>操作</th>
										</tr>
									</thead>
									<{foreach $us as $rs}>
										<tr>
											<td><{$rs[ 'uid']}></td>
											<td><{$rs[ 'user_name']}></td>
											<td><{$rs[ 'email']}></td>
											<td><{$rs[ 'port']}></td>
											<td><{$rs[ 'plan']}></td>
											<td><{\Ss\Etc\Comm::flowAutoShow($rs[ 'transfer_enable'])}></td>
											<td><{\Ss\Etc\Comm::flowAutoShow(($rs[ 'transfer_enable']-$rs[ 'u']-$rs[ 'd']))}></td>
											<td><{\Ss\Etc\Comm::flowAutoShow(($rs[ 'u']+$rs[ 'd']))}></td>
											<td><{\Ss\Etc\Comm::flowAutoShow($rs[ 'u'])}></td>
											<td><{\Ss\Etc\Comm::flowAutoShow($rs[ 'd'])}></td>
											<td><{$rs[ 'reg_date']}></td>
											<td><{date( 'Y-m-d H:i',$rs[ 'last_check_in_time'])}></td>
											<td><{date( 'Y-m-d H:i',$rs[ 't'])}></td>
											<td>
											    <{if $rs[ 'enable'] == 1}><a href="user_false.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定停止吗？')">正常</a><{else}><a href="user_true.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定启用吗？')"><code>停止</code></a><{/if}>
											</td>
											<td>
											    <{if $rs[ 'enable'] == 3}><a href="user_false.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定解封吗？')"><code>封禁</code></a><{else}><a href="user_ban.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定封禁吗？')">正常</a><{/if}></a>
											</td>
											<td><{get_ref_name rs=$rs[ 'ref_by']}></td>
											<{* 调用自定义插件 传$rs[ 'ref_by'] 然后返回数据 *}>
											<td><{$rs[ 'invite_num']}></td>
											<td>
												<a class="btn btn-brand waves-attach waves-light" href="user_edit.php?uid=<{$rs['uid']}>">查看</a>
												<a class="btn btn-red waves-attach waves-light" href="user_del.php?uid=<{$rs['uid']}>" onclick="JavaScript:return confirm('确定删除吗？')">删除</a>
											</td>
										</tr>
									<{/foreach}>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="<{$resources_dir}>/assets/plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="<{$resources_dir}>/assets/plugins/datatables/media/js/file-size.js"></script>
	<script type="text/javascript" language="javascript" src="<{$resources_dir}>/assets/plugins/datatables/media/js/dataTables.colVis.min.js"></script>
	<script type="text/javascript">
  $(document).ready(function () {
        $('#user').dataTable({
            "language": {
                "url": "<{$resources_dir}>/assets/plugins/datatables/media/Chinese.json"
            },
            "bStateSave": true,
            columnDefs: [
           { type: 'file-size', targets: 4 },
           { type: 'file-size', targets: 5 },
           { type: 'file-size', targets: 6 },
           { type: 'file-size', targets: 7 },
           { type: 'file-size', targets: 8 }
        ],
        "dom": 'C<"clear">lfrtip',
        "colVis": {
            "buttonText": "显示/隐藏列",
            exclude: [ 0,1,15 ],
            restore: "还原",
            showAll: "显示所有",
            showNone: "不显示",
            groups: [
                {
                    title: "只看流量",
                    columns: [ 9,10,11,12,13,14 ]
                },
                {
                    title: "只看日期",
                    columns: [ 4,5,6,7,8,12,13,14 ]
                },
                {
                    title: "只看状态/邀请",
                    columns: [ 4,5,6,7,8,9,10,11 ]
                }
            ]
        }
        });
    });
</script>
</body>
