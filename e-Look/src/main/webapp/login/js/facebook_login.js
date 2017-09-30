/**
 * 
 */
	window.fbAsyncInit = function() {
		FB.init({
			appId : '1663714756974189',
			status : true,
			cookie : true,
			xfbml : true,
			version : 'v2.10'
		});

		FB.AppEvents.logPageView();
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/zh_TW/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	function myFacebookLogin() {
		FB.login(function(response) {
			if (response.status === 'connected') {
				FB.api('/me', {
					fields : 'email,name,last_name,picture'
				}, function(response) {
					
					console.log('Good to see you, ' + response.name + '.');
					console.log('Good to see you, ' + response.email + '.');
					console.log('Good to see you, ' + response.picture.data.url
							+ '.');
				});
			} else {
				alert("login out")
			}
		}, {
			scope : 'public_profile,email'
		});
	}