<%@ page import="java.sql.*" %>
<%@ page import="static sun.awt.X11.XConstants.Success" %><%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 12/11/16
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Details | College Database</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<%
    String dbString = "jdbc:mysql://localhost:3306/datacrate?user=root&password=mysql&useSSL=false";
    String id = request.getParameter("s_id");
    String pass = request.getParameter("s_pass");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbString);
        Statement statement = connection.createStatement();
        ResultSet resultSet;
        resultSet = statement.executeQuery("SELECT pass FROM s_login WHERE roll='" + id + "'");
        boolean userExists = false;
        boolean loggedIn = false;
        if (resultSet.next()) {
            userExists = true;
            String realPass = resultSet.getString("pass");
            if (pass.equals(realPass)) {
                loggedIn = true;
            }
        }
%>
<nav class="navbar navbar-default navbar-fixed-top">
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
                <li><a href="sNames.jsp">Students</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="sNames.jsp">Students</a></li>
        <li><a href="sLogin.jsp">Student Login</a></li>
        <li class="active"><a href="#">Student Details</a></li>
    </ol>
    <%
        if (userExists) {
            if (loggedIn) {%>
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Logged In.
    </div>

    <%} else {%>
    <div class="jumbotron alert alert-warning">
        <h1>Login Failed</h1>
        <h4>Try <a href="sLogin.jsp">Logging in</a> again</h4>
    </div>
    <%
        }
    } else {
    %>
    <div class="jumbotron alert alert-warning">
        <h1>No User Found</h1>
        <h4>Try <a href="sLogin.jsp">Logging in</a> again</h4>
    </div>
    <%
        }
    %>
</div>
<%
        connection.close();
    } catch (SQLException e) {
        System.out.println(e);
    }
%>
</body>
</html>
