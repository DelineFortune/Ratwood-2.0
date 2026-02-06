/datum/scholar_html_interface
	var/mob/user

/datum/scholar_html_interface/New(mob/target_user)
	user = target_user
	..()

/datum/scholar_html_interface/proc/open()
	if(!user || !user.client)
		return

	user << browse_rsc('html/bg.png')

	var/html = {"
	<html>
	<head>
		<style>
			html, body {
				width: 100%;
				height: 100%;
				margin: 0;
				padding: 0;
				background: #000;
				overflow: hidden;
				font-family: Arial, sans-serif;
				color: #fff;
			}

			.root {
				position: absolute;
				inset: 0;
				background-image:
					linear-gradient(rgba(0,0,0,0.65), rgba(0,0,0,0.65)),
					url('bg.png');
				background-size: cover;
				background-position: center;
				background-repeat: no-repeat;
			}

			.header {
				position: absolute;
				left: 0;
				right: 0;
				top: 0;
				height: 54px;
				display: flex;
				align-items: center;
				padding: 0 16px;
				background: rgba(0,0,0,0.55);
				border-bottom: 1px solid rgba(255,255,255,0.15);
				box-sizing: border-box;
			}

			.title {
				font-weight: 800;
				letter-spacing: 1px;
			}

			.closebtn {
				margin-left: auto;
				padding: 8px 12px;
				border: 1px solid rgba(255,255,255,0.35);
				background: rgba(0,0,0,0.5);
				color: #fff;
				cursor: pointer;
				user-select: none;
			}

			.closebtn:hover {
				background: rgba(120,0,0,0.45);
			}

			.content {
				position: absolute;
				left: 0;
				right: 0;
				top: 54px;
				bottom: 0;
				padding: 16px;
				box-sizing: border-box;
			}

			.panel {
				max-width: 520px;
				background: rgba(0,0,0,0.55);
				border: 1px solid rgba(255,255,255,0.12);
				padding: 14px;
			}
		</style>
	</head>
	<body>
		<div class="root">
			<div class="header">
				<div class="title">WAS IS JUST HTML ALL ALONG</div>
				<a class="closebtn" href="byond://?src=[REF(src)];action=close">CLOSE</a>
			</div>

			<div class="content">
				<div class="panel">
					<div><b>Pick your faith bla bla</b></div>
					<div style="opacity:0.85;margin-top:6px;">
					</div>
				</div>
			</div>
		</div>
	</body>
	</html>
	"}

	user << browse(html, "window=scholar_ui;size=1100x700;can_resize=1")

/datum/scholar_html_interface/Topic(href, href_list)
	..()
	if(!user)
		return

	switch(href_list["action"])
		if("close")
			user << browse(null, "window=scholar_ui")
