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
    <link rel="shortcut icon" href="${server.contextroot}/img/favicon.ico">

    <meta name="description" content="notifier app is used to add notes">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link type="text/css" rel="stylesheet"
          href="${server.contextroot}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link type="text/css" rel="stylesheet"
          href="${server.contextroot}/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link type="text/css" rel="stylesheet" href="${server.contextroot}/vendor/css/font.css">
    <!-- Google fonts - Muli-->
    <link type="text/css" rel="stylesheet" href="${server.contextroot}/vendor/css/style.blue.css"
          id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link type="text/css" rel="stylesheet" href="${server.contextroot}/vendor/css/custom.css">
    <!-- Favicon-->
    <link type="image/icon" rel="shortcut icon" href="${server.contextroot}/img/favicon.ico">

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
                    <h2 class="h5 no-margin-bottom">All Medicines </h2>
                </div>
                <div class="right-menu list-inline no-margin-bottom">
                    <div class="list-inline-item" >
                        <button type="button" style="margin-right:1rem;background-color: #ffffff" data-toggle="modal" data-target="#addNotebook" class="btn button-add"> Add Medicines
                        </button>
                        <a href="donate" style="margin-right:1rem;background-color: #ffffff"  class="btn button-add">View All User Donate Data
                        </a>
                        <a href="#" style="background-color: #ffffff" class="btn button-add">View All User Request Data
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--add note book-->

        <!-- Modal Form-->
        <!-- Modal-->
        <div id="addNotebook" tabindex="-1" role="dialog" aria-labelledby="addNotebookLabel" aria-hidden="true"
             class="modal fade text-left">
            <div role="document" class="modal-dialog">
                <div class="modal-content" style="border-radius: 10px;
    background: white;
    color: #000;">
                    <div class="modal-header"><strong id="addNotebookLabel" class="modal-title">ADD MEDICINES</strong>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                                aria-hidden="true">x</span></button>
                    </div>


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
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>

        <!--end add note book-->

        <!--Notebook-->
        <table class="table table-hover table-bordered" style="width: 80%;margin: auto;">
            <thead class="thead-dark">
              <tr>
                <th>Id</th>
                <th>Medicine Name</th>
                <th>Medicine Category</th>
                <th>Medicine Quantity</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${medicineList.size() == 0}">
                        <tr>
                            <td colspan="5" style="text-align: center; color: #000;">No Records Found</td>
                        </tr>

                    </c:when>
                    <c:when test="${medicineList.size() > 0}">
                        <c:forEach items="${medicineList}" var="item">
                            <tr>
                            <td>${item.getId()}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getCategory()}</td>
                            <td>${item.getQuantity()}</td>
                            <td><a style="color: red; text-decoration: underline;" href="deleteMedicine?Id=${item.getId()}"> Delete</a></td>
                        </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
 

            </tbody>
          </table>

        <div class="col-lg-12 " id="notebook" style="margin: auto; width: 80%">




                <div id="editNotebook${item.getId()}" tabindex="-1" role="dialog"
                     aria-labelledby="editNotebookLabel" aria-hidden="true"
                     class="modal fade text-left">
                    <div role="document" class="modal-dialog">
                        <div class="modal-content" style="border-radius: 10px;
    background: white;
    color: #000;">
                            <div class="modal-header"><strong id="editNotebook" class="modal-title">Edit
                                NOTEBOOK</strong>
                                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                                        aria-hidden="true">x</span></button>
                            </div>


                            <form action="editnotebook" id="editNotebook" name="editNotebook" method="POST">
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label for="notebookName"></label>

                                        <input type="hidden" id="notebookId" name="notebookId"
                                               value="${item.getId()}" class="form-control">
                                    </div>


                                    <div class="form-group">
                                        <label for="notebookName">NOTE BOOK NAME</label>
                                        <input type="text" placeholder="Enter notebook name" id="notebookName"
                                               name="notebookName" value="${item.getName()}"
                                               class="form-control">
                                        <span><label id="notebookName-error" class="error"
                                                     for="notebookName"></label></span>

                                    </div>
                                    <div class="form-group">
                                        <label for="notebookDescription">Description</label>
                                        <input type="text" placeholder="Enter description about notebook"
                                               id="notebookDescription" name="notebookDescription"
                                               value="${item.getCategory()}" class="form-control">
                                        <span><label id="notebookDescription-error" class="error"
                                                     for="notebookDescription"></label></span>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal" class="btn btn-secondary">Close</button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>


        </div>

        <!-- end Notebook-->

        <!-- Modal for edit user -->


    </div>
    <!--end main page content-->
</div>



<!-- JavaScript files-->
<script src="${server.contextroot}/vendor/jquery/jquery.min.js"></script>
<script src="${server.contextroot}/vendor/popper.js/umd/popper.min.js"></script>
<script src="${server.contextroot}/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${server.contextroot}/vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="${server.contextroot}/vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="${server.contextroot}/js/front.js"></script>
<script src="${server.contextroot}/js/custom.js"></script>

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