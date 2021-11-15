<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login/login_style.css">
</head>

<body>
    <div class="container">
        <div class="rectLeft">
            <div class="login">
                <img src="${pageContext.request.contextPath}/assets/images/page_login/logo.png">

                <h3>Website Neumorphism Sale of Socks online</h3>

                <input type="button" class="btn" href="#" value="SIGN IN">
            </div>
        </div>
        <div class="rectRight">
            <div class="login">
                <h1 style="color:black; font-size: 3rem;">Create Account</h1>

                <div class="icons">
                    <i class="fa fa-facebook-f"></i>
                    <i class="fa fa-linkedin"></i>
                    <i class="fa fa-twitter"></i>
                </div>

                <h4>or use email for registration</h4>

                <div class="formulaire">
                    <form method="post" onsubmit="return seloger()">
                        <!-- Form -->
                        <div class="form-group">
                            <div class="input-group-text"><span class="fa fa-user"></span></div>
                            <input class="form-control" id="inputName" name="inputName" placeholder="John" type="text" aria-label="name"
                                value="admin">
                        </div>
                        <div class="form-group">
                            <div class="input-group-text"><span class="fa fa-envelope"></span></div>
                            <input class="form-control" id="inputEmail" name="inputEmail" placeholder="example@company.com" type="text"
                                aria-label="email adress" >
                        </div>
                        <div class="form-group">
                            <div class="input-group-text"><span class="fa fa-unlock-alt"></span></div>
                            <input class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" type="password"
                                aria-label="Password" value="1234">
                            <button type="button" class="btn-eye" onclick="showPassword()"><span class="fa fa-eye"></span></button>
                        </div>
                        <!-- <button class="btn-randomPass" onclick="genererPassword()">Generate random password</button>-->
                        <input type="submit" class="btnUp" id="btnUp" value="SIGN UP"/>
                    </form>
                </div>
            </div>
        </div>
        <!-- #region Notification Success AND Failed-->
        <div class="notification notification-success" id="notifSuccess-content">
                <span class="alert-inner--icon"><span class="fa fa-check"></span></span>
                <span class="alert-inner--text"><strong>Well done!</strong> You successfully Login on ShopSette.</span>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
        </div>

        <div class="notification notification-failed" id="notifFail-content">
            <span class="alert-inner--icon"><span class="fa fa-times"></span></span>
            <span class="alert-inner--text"><strong>Fail Authentification!</strong> Please try verifed Name or/and Password.</span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <!-- #endregion -->
    </div>


    <script src="${pageContext.request.contextPath}/login/login_main.js"></script>
    <script type="text/javascript">
	function setCookie(cname, cvalue, exdays) {
		const d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		let expires = "expires=" + d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	function seloger(login, password) {
		
		document.getElementById("submitbtn").innerHTML = '<div class="spinner-border" role="status"><span class="sr-only"></span></div>'; 
		
		name = document.getElementById('inputName').value
		email = document.getElementById('inputEmail').value
		password = document.getElementById('inputPassword').value
		
		var details = {
		    'username': name,
		    'email': email,
		    'password': password
		};
		// préparation des paramètres 
		var formBody = [];
		for (var property in details) {
		  var encodedKey = encodeURIComponent(property);
		  var encodedValue = encodeURIComponent(details[property]);
		  formBody.push(encodedKey + "=" + encodedValue);
		}
		formBody = formBody.join("&");
		fetch("http://localhost:8080/ecommerce/", {
		  method: 'POST',
		  headers: {
		    'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		  },
		  body: formBody
		})
		.then(res => {
            return res.text(); // extraction du texte à partir de l'objet response de fetch API
        })
		.then(function(data){ 
			console.log( data.indexOf("ok") );
			
			if( data.indexOf("ok") >=  0 ){
				window.location = 'HomeServlet'; 
			}else{
				document.getElementById('msgErr').style.display = "block";
			}
			
		})
		
		document.getElementById("submitbtn").innerHTML = 'Authentifier';
		
		return false; 
		
		/* if (  ) { // authentification réussie
			setCookie("username", login, 3)
			// login étant le nom d'utilisateur qui vient de s'authentifier
			window.location = "dashboard.html"
		} else {
			alert("Login ou password est incorrect!")
		} */ 
	}
    </script>
</body>

</html>