<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1, user-scalable=no">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>查看登录IP - <{$site_name}></title>
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
				<h1 class="content-heading">查看IP&nbsp<small>IP List</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在查看 <{$site_name}> 的IP。</p>
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
								<table class="table table_no dataTable" id="ip" title="IP List">
									<thead>
										<tr>
											<th>ID</th>
											<th>uid</th>
											<th>登录IP</th>
											<th>服务商地址</th>
											<th>时间</th>
										</tr>
									</thead>
									<{foreach $us as $rs}>
										<tr>
										    <td><{$rs['id']}></td>
										    <td><{$rs['uid']}></td>
										    <td><{$rs['ip']}></td>
										    <td><{$rs['location']}></td>
										    <td><{date('Y-m-d H:i:s',$rs['time'])}></td>
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
        $('#ip').dataTable({
            "language": {
                "url": "<{$resources_dir}>/assets/plugins/datatables/media/Chinese.json"
            },
            "bStateSave": true,
        "dom": 'C<"clear">lfrtip',
        });
    });
</script>
</body>
