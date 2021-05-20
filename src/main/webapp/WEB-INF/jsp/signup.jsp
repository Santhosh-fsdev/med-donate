<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Signup | Med-Donate</title>
    <meta name="description" content="SIGNUP NOTIFIER application">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="vendor/css/font.css">

    <!-- theme stylesheet-->
    <link rel="stylesheet" href="vendor/css/style.blue.css" id="theme-stylesheet">
    
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="vendor/css/custom.css">
    
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">


</head>
<body>
 <div class="login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>Med-Donate</h1>
                  </div>
                  
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form  method="post" id="signupform" name="signupform" action="signup" class="text-left ">
                  	             <span><label id="login-error" class="error" for="signupform">
                  <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%>
                  </label></span>
                      <div class="form-group">
                      <input id="username" type="text" name="username" class="input-material">
                      <label for="username" class="label-material">Username</label>
                      <span><label id="username-error" class="error" for="username"></label></span>
                    </div>
                    <div class="form-group">
                      <input id="phone" type="text" name="phone" class="input-material">
                      <label for="phone" class="label-material">Phone Number</label>
                      <span><label id="phone-error" class="error" for="phone"></label></span>
                    </div>
                     <div class="form-group">
                      <input id="email" type="email" name="email" class="input-material">
                      <label for="email" class="label-material">Email</label>
                      <span><label id="email-error" class="error" for="email"></label></span>
                    </div>
                    <div class="form-group">
                      <input id="password" type="password" name="password" class="input-material">
                      <label for="password" class="label-material">Password</label>
                      <span><label id="password-error" class="error" for="password"></label></span>
                    </div>
                     <div class="form-group">
                      <input id="confirmPassword" type="text" name="confirmPassword" class="input-material">
                      <label for="confirmPassword" class="label-material">Confirm Password</label>
                      <span><label id="confirmPassword-error" class="error" for="confirmPassword"></label></span>
                    </div>
                    
                    <div class="form-group text-center">
                      <input id="register" type="submit"class="btn btn-primary">
                    </div>
                  </form><small>Already have an account? </small><a href="/" class="signup">Login</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/front.js"></script>
    <script src="js/custom.js"></script>
    
     <script>
      

      
        
        $(function() {
      	  
      	  
            $("form[name='signupform']").validate({
              
            	  rules: {
                      email: {required:true,email:true},     
          	        username:{required:true,minlength:2,maxlength:15},
          	        password:{required:true,minlength:8,maxlength:15,pswcheck:true},
          	        phone:{required:true,phoneIND:true},
          	        confirmPassword:{required:true,equalTo: "#password"}
                    
                    
                    },
                    messages: {
                  	  
                  	  
                      email: {required:"Please enter your email",email:"Please enter vaild email"},
                       password: {required:"please enter your password",pswcheck:"minmum 1 lowercase,1 uppercase,1 special character,1 digit",
                      	 minlength:"minimum password lenght must be 8",maxlength:"maximum password length must be 15"},
                     	username: {minlength:"username must be greater than two digit",required:"Please enter your username"},
                     	confirmPassword:{required:"Please enter confirm password",equalTo:"Password did'nt match"},
                     	phone:{required:"please enter phone number",phoneIND:"Enter valid phone number"}
                     	
                    }   
            });
          });
     
       </script>

</body>
</html>