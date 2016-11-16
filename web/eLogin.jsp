<%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 12/11/16
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Login | College Database</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" id="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">College Database</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="eNames.jsp">Employees</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="eNames.jsp">Employees</a></li>
        <li class="active"><a href="#">Employee Login</a></li>
    </ol>
    <form class="form-horizontal" action="eDetails.jsp">
        <fieldset>
            <legend>Employee Login</legend>
            <div class="form-group">
                <label for="inputId" class="col-lg-2 control-label">Employee Id</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputId" name="e_id" placeholder="Employee Id"
                           required="required">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="inputPassword" name="e_pass" placeholder="Password"
                           required="required">
                </div>
            </div>
            <br>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <button type="reset" class="btn btn-default" style="margin-right:5px">Cancel</button>
                    <button type="submit" class="btn btn-primary" style="margin-left:5px">Submit</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
