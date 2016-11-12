<%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 11/11/16
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome | College Database</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
  </head>
  <body>
      <nav class="navbar navbar-inverse">
          <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="#">College Database</a>
              </div>

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav navbar-right">
                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
                          <ul class="dropdown-menu">
                              <li><a href="sLogin.jsp">Student</a></li>
                              <li><a href="eLogin.jsp">Employee</a></li>
                              <li role="separator" class="divider"></li>
                              <li><a href="aLogin.jsp">Admin</a></li>
                          </ul>
                      </li>
                  </ul>
              </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
      </nav>
      <div class="container">
          <ol class="breadcrumb">
              <li class="active"><a href="#">Home</a></li>
          </ol>
      <h1>Welcome to the College Database Portal</h1>
      <h3>This is a portal for both <a href="sNames.jsp">Students</a> and <a href="eNames.jsp">Employees</a></h3>
      <h4>Students can look at their :</h4>
      <ol>
          <li>Details</li>
          <li>Courses Enrolled</li>
          <li>Books Borrowed From Library</li>
      </ol>
      <h4>Employees can look at their :</h4>
      <ol>
          <li>Details</li>
          <li>Courses Teaching</li>
          <li>Books Borrowed From Library</li>
      </ol>
      <h4>Employees can change Details like :</h4>
      <ul>
          <li>Address</li>
          <li>First Name</li>
          <li>Last Name</li>
      </ul>
  </div>


  </body>
</html>
