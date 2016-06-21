<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>用戶協議 -<{$site_name}></title>
<{include file='header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<h1 class="content-heading">用戶協議 <small>TOS</small></h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p>以下是<{$site_name}>（本站）的用戶協議，註冊視為同意本協議。</p>
								</div>
							</div>
						</div>
						<div class="card">
                            <div class="card-main">
                                <div class="card-inner">
                                    <{$tos_content}>
                                </div>
                            </div>
                        </div>
					</section>
				</div>
			</div>
		</div>
	</main>
</body>
<{include file='footer.tpl'}>
</html>