<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 16/11/16
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Changes | College Database</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<%
    String dbString = "jdbc:mysql://localhost:3306/datacrate?user=root&password=mysql&useSSL=false";
    String id = request.getParameter("e_id");
    String pass = request.getParameter("e_pass");
    boolean loggedIn = false;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbString);
        Statement statement = connection.createStatement();
        ResultSet resultSet;
        resultSet = statement.executeQuery("SELECT pass FROM e_login WHERE roll='" + id + "'");
        resultSet.next();
        String realPass = resultSet.getString("pass");
        if (pass.equals(realPass)) {
            loggedIn = true;
        }
        connection.close();
%>
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
        <li><a href="eLogin.jsp">Employee Login</a></li>
        <li class="active"><a href="eDetails.jsp?e_id=<%=id%>&e_pass=<%=pass%>">Employee Details</a></li>
        <li><a href="#">Employee Changes</a></li>
    </ol>
    <%
        if (loggedIn) {
    %>
    <form class="form-horizontal" action="eChangesR.jsp">
        <fieldset>
            <legend>Enter The Details You Want To Change</legend>
            <input type="hidden" name="e_id" value="<%=id%>">
            <input type="hidden" name="e_pass" value="<%=pass%>">
            <div class="form-group">
                <label for="inputfName" class="col-lg-2 control-label">First Name</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputfName" name="f_name" placeholder="First Name">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label for="inputlName" class="col-lg-2 control-label">Last Name</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputlName" name="l_name" placeholder="Last Name">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label for="inputAddress" class="col-lg-2 control-label">Address</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputAddress" name="addr" placeholder="Address">
                </div>
            </div>
            <br>
            <div class="form-group">
                <label for="inputNpass" class="col-lg-2 control-label">New Password</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="inputNpass" name="n_pass"
                           placeholder="New Password">
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
    <%
    } else {
    %>
    <div class="jumbotron alert alert-warning">
        <h1>Wrong Password</h1>
        <h4>Try <a href="eLogin.jsp">Logging in</a> again</h4>
    </div>
    <%
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    %>
</div>
</body>
</html>
