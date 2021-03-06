<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Med-Donate</title>
    <meta name="description" content="SIGNUP NOTIFIER application" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="all,follow" />

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" />

    <!-- Font Awesome CSS-->
    <link
      rel="stylesheet"
      href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css"
    />

    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/css/font.css" />

    <!-- theme stylesheet-->
    "
    <link
      rel="stylesheet"
      rel="stylesheet"
      href="<%=request.getContextPath()%>/vendor/css/style.blue.css"
      id="theme-stylesheet"
    />

    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/css/custom.css" />

    <!-- Favicon-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico" />
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
            <div class="col-lg-6">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <div>
                    <span
                      ><label id="login-error" class="error" for="loginform">
                        <%=(request.getAttribute("errMessage") == null) ? "" :
                        request.getAttribute("errMessage")%>
                      </label></span
                    >
                    <div class="form-group">
                      <input
                        id="userName"
                        name="userName"
                        type="text"
                        class="input-material"
                      />
                      <label for="userName" class="label-material">User Name</label>
                    </div>
                    <div class="form-group">
                      <input
                        id="password"
                        type="password"
                        name="password"
                        class="input-material"
                      />
                      <label for="password" class="label-material"
                        >Password</label
                      >
                      <span
                        ><label
                          id="password-error"
                          class="error"
                          for="password"
                        ></label
                      ></span>
                    </div>
                    <button
                      type="submit"
                      id="login"
                      name="login"
                      class="btn btn-primary"
                    >
                      Login
                    </button>
                  </div>
                  <small>Do not have an account? </small
                  ><a
                    href="register"
                    class="signup"
                    >Register</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- JavaScript files-->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/popper.js/umd/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/front.js"></script>
    <script src="<%=request.getContextPath()%>/js/custom.js"></script>
    <script>
    let btn = document.getElementById("login");
        btn.addEventListener("click", submitLogin);

      function submitLogin() {
        let userName = document.getElementById("userName").value;
        let password = document.getElementById("password").value;
        var settings = {
          url: "login",
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          data: JSON.stringify({ userName: userName  , password: password }),
        };

        $.ajax(settings).done(function (response) {
          if(response === "success"){
              window.location.href = "<%=request.getContextPath()%>/adminhome";
          }
        });
      }
    </script>
  </body>
</html>
