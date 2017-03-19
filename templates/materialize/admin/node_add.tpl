<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>添加节点 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
<body>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">添加节点&nbsp<small>Add Node</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在 <{$site_name}> 上添加节点。</p>
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
										<label class="floating-label" for="plan">加密方式</label>
										<select id="node_method" class="form-control" onchange="changeForm(this.value)">
											<{$method = strtolower($rs['node_method'])}>
											<option value="custom_node_method">自定义加密方式</option>
											<option value="rc4-md5" <{if $method =="rc4-md5"}> selected="selected"<{/if}> >rc4-md5</option>
											<option value="aes-256-cfb" <{if $method =="aes-256-cfb"}> selected="selected"<{/if}> >aes-256-cfb</option>
											<option value="aes-192-cfb" <{if $method =="aes-192-cfb"}> selected="selected"<{/if}> >aes-192-cfb</option>
											<option value="aes-128-cfb" <{if $method =="aes-128-cfb"}> selected="selected"<{/if}> >aes-128-cfb</option>
											<option value="rc4" <{if $method =="rc4"}> selected="selected"<{/if}> >rc4</option>
											<option value="salsa20" <{if $method =="salsa20"}> selected="selected"<{/if}> >salsa20</option>
											<option value="chacha20" <{if $method =="chacha20"}> selected="selected"<{/if}> >chacha20</option>
											<option value="table" <{if $method =="table"}> selected="selected"<{/if}> >table</option>
										</select>
									</div>
									<div class="form-group form-group-label" id="custom_node_method_form">
										<label class="floating-label" for="custom_node_method">自定义加密方式</label>
										<input class="form-control" id="custom_node_method" type="text" value="<{$rs['node_method']}>">
									</div>
									
									<div class="form-group form-group-label">
										<label class="floating-label" for="protocol">加密协议(SSR特性)</label>
										<input class="form-control" id="protocol" type="text" value="<{$rs['protocol']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="obfs">混淆方式(SSR特性)</label>
										<input class="form-control" id="obfs" type="text" value="<{$rs['obfs']}>">
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
										<label class="floating-label" for="node_type">分类（0为普通节点，1为高级节点）</label>
										<input class="form-control" id="node_type" type="text" value="<{$rs['node_type']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_status">节点状态</label>
										<input class="form-control" id="node_status" type="text" value="<{$rs['node_status']}>">
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="node_order">排序（0为最高）</label>
										<input class="form-control" id="node_order" type="text"  value="<{$rs['node_order']}>">
									</div>
									<button class="btn btn-block btn-brand waves-attach waves-light" id="Submit" type="submit">添加</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
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
                    node_method: $("#node_method").val()=="custom_node_method" ? $("#custom_node_method").val() : $("#node_method").val(),
                    node_info: $("#node_info").val(),
                    node_type: $("#node_type").val(),
                    node_status: $("#node_status").val(),
                    node_order: $("#node_order").val(),
					protocol: $("#protocol").val(),
					obfs: $("#obfs").val(),
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
    function changeForm(value){
     if(value=="custom_node_method") {
         $('#custom_node_method_form').show(200);
         $('#custom_node_method_form').focus();
         $('#custom_node_method_form').select();
     }else{
         $('#custom_node_method_form').hide(200);
     }
   }
    window.onload = changeForm($("#node_method").val());
</script>
