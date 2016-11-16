<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 12/11/16
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
<%
    String dbString = "jdbc:mysql://localhost:3306/datacrate?user=root&password=mysql&useSSL=false";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbString);
        Statement statement = connection.createStatement();
        ResultSet resultSet;
        resultSet = statement.executeQuery("SELECT * FROM e_details");
%>

<nav class="navbar navbar-default navbar-fixed-top" id="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Login <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="sLogin.jsp">Student</a></li>
                        <li><a href="eLogin.jsp">Employee</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="aLogin.jsp">Admin</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <ol class="breadcrumb">
        <li><a href="/">Home</a></li>
        <li class="active"><a href="#">Employees</a></li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">All Employees in College Database</div>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th>S.No</th>
                <th>Employee Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Department</th>
                <th>Address</th>
            </tr>
            </thead>
            <tbody>
            <%
                int i = 0;
                while (resultSet.next()) {
                    i++;
            %>
            <tr>
                <td><%= i%>
                </td>
                <td><%= resultSet.getInt("e_roll")%>
                </td>
                <td><%= resultSet.getString("first_name")%>
                </td>
                <td><%= resultSet.getString("last_name")%>
                </td>
                <td><%= resultSet.getString("dep_id")%>
                </td>
                <td><%= resultSet.getString("address")%>
                </td>
            </tr>

            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<%
        connection.close();
    } catch (SQLException e) {
        System.out.println(e);
    }
%>
</body>
</html>
