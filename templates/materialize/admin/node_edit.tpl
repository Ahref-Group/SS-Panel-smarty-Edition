<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>编辑节点 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
<body>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">编辑节点&nbsp<small>Edit Node</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在修改 <{$rs['node_name']}> 的资料。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading"><{$rs['node_name']}>节点信息</p>
								<form role="form" method="post" action="javascript:void(0);">
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_name">节点名称</label>
										<input class="form-control" id="node_name" type="text" value="<{$rs['node_name']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_server">节点地址</label>
										<input class="form-control" id="node_server" type="text" value="<{$rs['node_server']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="parameter">混淆参数(SSR特性)</label>
										<input class="form-control" id="parameter" type="text" value="<{$rs['parameter']}>">
									</div>
									
									
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_info">节点描述</label>
										<textarea class="form-control textarea-autosize" id="node_info" rows="1"><{$rs['node_info']}></textarea>
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_type">分类(0为普通节点，1为高级节点）</label>
										<input class="form-control" id="node_type" type="text" value="<{$rs['node_type']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_status">节点状态</label>
										<input class="form-control" id="node_status" type="text" value="<{$rs['node_status']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_order">排序(0为最高)</label>
										<input class="form-control" id="node_order" type="text"  value="<{$rs['node_order']}>">
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
						<{include file='loading.tpl'}>
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
    <!-- AES -->
    <script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
    <script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#Submit").click(function(){
            $('#result').modal();
            $('#loading').show();
            $.ajax({
                type:"POST",
                url:"node_add.php",
                dataType:"json",
                data:{
                    node_id: "<{$id}>",
                    node_name: $("#node_name").val(),
                    node_server: $("#node_server").val(),
                    node_info: $("#node_info").val(),
                    node_type: $("#node_type").val(),
                    node_status: $("#node_status").val(),
                    node_order: $("#node_order").val(),
					parameter: $("#parameter").val()
                },
                success:function(data){
                    if(data.ok){
                        $('#loading').hide();
                        $("#msg").html(data.msg);
                    }else{
                       $('#loading').hide();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                        $("#msg").html("发生错误："+jqXHR.status);
                        $('#loading').hide();
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                }
            })
        })
    })
</script>
