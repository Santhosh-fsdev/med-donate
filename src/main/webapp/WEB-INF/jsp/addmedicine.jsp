<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="com.example.medicinedonate.entity.Medicine" %>
<%@ page import="com.example.medicinedonate.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">

    <title>Med Donate</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">

    <meta name="description" content="notifier app is used to add notes">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link type="text/css" rel="stylesheet"
          href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link type="text/css" rel="stylesheet"
          href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/vendor/css/font.css">
    <!-- Google fonts - Muli-->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/vendor/css/style.blue.css"
          id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/vendor/css/custom.css">
    <!-- Favicon-->
    <link type="image/icon" rel="shortcut icon" href="/img/favicon.ico">

</head>

<body>


<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    User user = null;
    ArrayList<Medicine> medicineList;
    if (session.getAttribute("user") == null) {
        response.sendRedirect("/");
    } else {
        user = (User) session.getAttribute("user");
        medicineList = (ArrayList<Medicine>) session.getAttribute("medicineList");
    }


%>


<header class="header">
    <nav class="navbar navbar-expand-sm" style="background-color: #ffffff">

        <!--nav content-->
        <div class="container-fluid d-flex align-items-center justify-content-between">

            <!-- Navbar Header-->
            <div class="navbar-header">
                <a href="" class="navbar-brand">
                    <div class="brand-text brand-big visible text-uppercase"><strong
                            class="text-primary">Med</strong><strong>Donate</strong></div>
                    <div class="brand-text brand-sm"><strong class="text-primary">Med</strong><strong>Donate</strong>
                    </div>
                </a>
            </div>
            <!--End Navbar Header-->
            <!--Right menu list-->
            <div class="right-menu list-inline no-margin-bottom" style="width: 10%">
                <!--End Message-->
                    <p style="display: inline; font-size:1.5rem"> ${user.userName}</p>
                    <a style="color: red; text-decoration: underline;" href="logout">Logout</a>

            </div>
        </div>
    </nav>
</header>


<div class="d-flex align-items-stretch">


    <!--main page content-->

    <div class="page-content" style="background-color: #ffffff;width: 100%">

        <!--page header-->
        <div class="page-header">
            <div class="container-fluid d-flex align-items-center justify-content-between">
                <div class="left-menu">
                    <h2 class="h5 no-margin-bottom">Add Medicines </h2>
                </div>
                <!-- <div class="right-menu list-inline no-margin-bottom">
                    <div class="list-inline-item" >
                        <a href="addmedicine" style="margin-right:1rem;background-color: #ffffff" id="addMedicine" name="addMedicine" class="btn button-add"> Add Medicine
                        </a>
                        <a href="donate" style="margin-right:1rem;background-color: #ffffff"  class="btn button-add">View All User Donate Data
                        </a>
                        <a href="#" style="background-color: #ffffff" class="btn button-add">View All User Request Data
                        </a>
                    </div>
                </div> -->
            </div>
        </div>

        <!--add note book-->

        <!-- Modal Form-->
        <!-- Modal-->


                    <form action="addMedicine" id="addNotebook" name="addNotebook" method="POST" return="false">
                        <div class="modal-body">


                            <div class="form-group">
                                <label for="medicineName">Medicine Name</label>
                                <input type="text" placeholder="Enter Medicine Name" id="medicineName"
                                       name="medicineName" class="form-control">
                                <span><label id="medicineName-error" class="error" for="medicineName"></label></span>

                            </div>
                            <div class="form-group">
                                <label for="medicineCategory">Medicine Category</label>
                                <input type="text" placeholder="Enter Medicine Category"
                                       id="medicineCategory" name="medicineCategory" class="form-control">
                                <span><label id="medicineCategory-error" class="error"
                                             for="medicineCategory"></label></span>
                            </div><div class="form-group">
                                <label for="medicineQuantity">Medicine Quantity</label>
                                <input type="Number" placeholder="Enter Medicine Quantity"
                                       id="medicineQuantity" name="medicineQuantity" class="form-control">
                                <span><label id="medicineQuantity-error" class="error"
                                             for="medicineQuantity"></label></span>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">Close</button>
                            <button type="submit" id="medicineSubmit" name="medicineSubmit" class="btn btn-primary">Save</button>
                        </div>
                    </form>

    </div>
    <!--end main page content-->
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


    $(function () {


        $("form[name='editNotebook']").validate({

            rules: {

                notebookName: {required: true, minlength: 2},
                notebookDescription: {required: true, minlength: 2},

            },
            messages: {
                notebookName: {
                    minlength: "Notebook name must be greater than two digit",
                    required: "Please enter notebook name"
                },
                notebookDescription: {
                    minlength: "Notebook Description must be greater than two digit",
                    required: "Please enter notebook name"
                },

            }
        });


        $("form[name='addNotebook']").validate({

            rules: {

                notebookName: {required: true, minlength: 2},
                notebookDescription: {required: true, minlength: 2},

            },
            messages: {
                notebookName: {
                    minlength: "Notebook name must be greater than two digit",
                    required: "Please enter notebook name"
                },
                notebookDescription: {
                    minlength: "Notebook Description must be greater than two digit",
                    required: "Please enter notebook name"
                },

            }
        });


    });


    function searchNote() {
        var input, filter, table, tr, td, i, txtValue, temp;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("notebook");
        tr = table.getElementsByClassName("notebookRow");


        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("div").cardname;

            if (td) {
                txtValue = td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

</script>


</body>

</html>