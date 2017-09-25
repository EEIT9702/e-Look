<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.css" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.25/jquery.fancybox.min.js" ></script> 

<style>
#hidden-content-b {
	/* Custom styling */
	max-width: 550px;
	border-radius: 4px;
	/* Custom transition - slide from top*/
	transform: translateY(-50px);
	transition: all .33s;
}

.fancybox-slide--current #hidden-content-b {
	transform: translateY(0);
}
</style>
</head>

<body>
	<h2>fancyBox v3.1 - Inline content</h2>

	<div class="grid">

		<p>#1 - Default example</p>
		<p>
			<a data-fancybox data-src="#hidden-content-a" href="javascript:;"
				class="btn">Open demo</a>
		</p>

		<div style="display: none;" id="hidden-content-a">
			<h2>Hello!</h2>
			<p>You are awesome!</p>
		</div>

	</div>
	<div class="grid">

		<p>#2 - Custom open/close animation using CSS:</p>
		<p>
			<a data-fancybox data-src="#hidden-content-b" href="javascript:;"
				class="btn">Open demo</a>
		</p>

		<div style="display: none;" id="hidden-content-b">
			<h2>Hello!</h2>
			<p>This is animated content! Cool, right?</p>
		</div>

	</div>
	<div class="grid">

		<p>#3 - Custom options: display default close button and disable
			touch</p>

		<p>
			<a data-fancybox
				data-options='{"src": "#hidden-content-c", "touch": false, "smallBtn" : false}'
				href="javascript:;" class="btn">Open demo</a>
		</p>

		<div style="display: none; max-width: 500px;" id="hidden-content-c">
			<h2>¡Hola!</h2>
			<p>
				Sometimes you would want to disable "touch" feature. <br />For
				example, when you want to make your content selectable.
			</p>
		</div>

	</div>

	<div class="grid">

		<p>#4 - Modal window</p>

		<p>
			<a data-fancybox
				data-options='{"src": "#hidden-content-d", "modal": true}'
				href="javascript:;" class="btn">登入在這裡</a>
		</p>

		<div style="display: none; max-width: 600px;" id="hidden-content-d">
			<div id="div1">
				<fieldset>
					<legend>login</legend>
					<form action="" method="get">
						<span>帳號</span><input type="text" name="username"><br>
						<span>密碼</span><input type="password" name="userpwd"><br>
						<input type="submit"><br>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>