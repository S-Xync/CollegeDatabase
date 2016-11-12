<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 12/11/16
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Details | College Database</title>
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
    String deptId;
    String dept;
    String address;
    String firstName;
    String lastName;
    int roll;
    ArrayList<String> coursesIds = new ArrayList<String>();
    ArrayList<String> courses = new ArrayList<String>();
    ArrayList<Integer> years = new ArrayList<Integer>();
    ArrayList<String> booksIds = new ArrayList<String>();
    ArrayList<String> books = new ArrayList<String>();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbString);
        Statement statement = connection.createStatement();
        ResultSet resultSet;
        resultSet = statement.executeQuery("SELECT pass FROM e_login WHERE roll='" + id + "'");
        boolean userExists = false;
        boolean loggedIn = false;
        if (resultSet.next()) {
            userExists = true;
            String realPass = resultSet.getString("pass");
            if (pass.equals(realPass)) {
                loggedIn = true;
            }
        }
        if (loggedIn) {
            resultSet = statement.executeQuery("SELECT * FROM e_details WHERE e_roll='" + id + "'");
            resultSet.next();
            roll = Integer.valueOf(id);
            deptId = resultSet.getString("dep_id");
            firstName = resultSet.getString("first_name");
            lastName = resultSet.getString("last_name");
            address = resultSet.getString("address");
            resultSet = statement.executeQuery("SELECT b_id FROM e_books WHERE roll='" + id + "'");
            while (resultSet.next()) {
                booksIds.add(resultSet.getString("b_id"));
            }
            resultSet = statement.executeQuery("SELECT c_id FROM e_courses WHERE roll='" + id + "'");
            while (resultSet.next()) {
                coursesIds.add(resultSet.getString("c_id"));
            }
            for (int i = 0; i < booksIds.size(); i++) {
                resultSet = statement.executeQuery("SELECT b_name FROM books WHERE b_id='" + booksIds.get(i) + "'");
                resultSet.next();
                books.add(resultSet.getString("b_name"));
            }
            for (int i = 0; i < coursesIds.size(); i++) {
                resultSet = statement.executeQuery("SELECT c_name,'year' FROM courses WHERE c_id='" + coursesIds.get(i) + "'");
                resultSet.next();
                courses.add(resultSet.getString("c_name"));
                years.add(resultSet.getInt("year"));
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Login
                        <span class="caret"></span></a>
                <li><a href="eNames.jsp">Employees</a></li>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li><a href="eNames.jsp">Employees</a></li>
        <li><a href="eLogin.jsp">Employee Login</a></li>
        <li class="active"><a href="#">Employee Details</a></li>
    </ol>
    <%
        if (userExists) {
            if (loggedIn) {%>
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> Logged in.
    </div>

    <%} else {%>
    <div class="jumbotron alert alert-warning">
        <h1>Login Failed</h1>
        <h4>Try <a href="eLogin.jsp">Logging in</a> again</h4>
    </div>
    <%
        }
    } else {
    %>
    <div class="jumbotron alert alert-warning">
        <h1>No User Found</h1>
        <h4>Try <a href="eLogin.jsp">Logging in</a> again</h4>
    </div>
    <%}%>
</div>
<%
        connection.close();
    } catch (SQLException e) {
        System.out.println(e);
    }
%>
</body>
</html>
