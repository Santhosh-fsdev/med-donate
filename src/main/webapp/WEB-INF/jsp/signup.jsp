<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Signup | Med-Donate</title>
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
    <link
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
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form id="signupform" name="signupform" class="text-left">
                    <span
                      ><label id="login-error" class="error" for="signupform">
                        <%=(request.getAttribute("errMessage") == null) ? "":
                        request.getAttribute("errMessage")%>
                      </label></span
                    >
                    <div class="form-group">
                      <input
                        id="userName"
                        type="text"
                        name="userName"
                        class="input-material"
                      />
                      <label for="userName" class="label-material"
                        >Username</label
                      >
                      <span
                        ><label
                          id="username-error"
                          class="error"
                          for="username"
                        ></label
                      ></span>
                    </div>
                    <div class="form-group">
                      <label for="age">Choose your age:</label>
                      <select name="cars" id="age" name="age">
                        <% for(int i = 18; i <= 50; i++) { %>
                        <option value="<%=i %>"><%=i %></option>
                        <% } %>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="gender">Choose your gender:</label>
                      <select name="cars" id="gender" name="gender">
                        <option value="male">male</option>
                        <option value="female">female</option>
                        <option value="others">others</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <input
                        id="address"
                        type="text"
                        name="address"
                        class="input-material"
                      />
                      <label for="address" class="label-material"
                        >Address</label
                      >
                      <span
                        ><label
                          id="address-error"
                          class="error"
                          for="address"
                        ></label
                      ></span>
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
                    <div class="form-group text-center">
                      <input
                        id="register"
                        name="register"
                        type="submit"
                        class="btn btn-primary"
                        value="REGISTER NOW"
                      />
                    </div>
                  </form>
                  <small>Already have an account? </small
                  ><a href="<%=request.getContextPath()%>/login" class="signup">Log In</a>
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
      
        let form = document.getElementById("signupform");
        form.addEventListener("submit", submitForm);
      function submitForm(e) {
        e.preventDefault();
        let userName = document.getElementById("userName").value;
        let age = document.getElementById("age").value;
        let gender = document.getElementById("gender").value;
        let address = document.getElementById("address").value;
        let password = document.getElementById("password").value;
        var settings = {
          url: "register",
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          data: JSON.stringify({
            userName: userName,
            password: password,
            age: age,
            gender: gender,
            address: address,
          }),
        };

        $.ajax(settings).done(function (response) {
          if(response === "success"){
              window.location.href = "<%=request.getContextPath()%>/login";
          }
          else{
            window.location.reload();
          }
        });
      }
    </script>
  </body>
</html>
