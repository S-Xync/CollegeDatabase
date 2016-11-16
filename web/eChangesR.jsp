<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: saikumar
  Date: 16/11/16
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Changes Result | College Database</title>
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
    boolean fnc = false;
    boolean lnc = false;
    boolean ac = false;
    boolean pc = false;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbString);
        Statement statement = connection.createStatement();
        if (!request.getParameter("f_name").isEmpty()) {
            statement.executeUpdate("UPDATE e_details SET " +
                    "first_name='" + request.getParameter("f_name") + "' " +
                    "WHERE e_roll='" + id + "'");
            fnc = true;
        }

        if (!request.getParameter("l_name").isEmpty()) {
            statement.executeUpdate("UPDATE e_details SET " +
                    "last_name='" + request.getParameter("l_name") + "' " +
                    "WHERE e_roll='" + id + "'");
            lnc = true;
        }

        if (!request.getParameter("addr").isEmpty()) {
            statement.executeUpdate("UPDATE e_details SET " +
                    "address='" + request.getParameter("addr") + "' " +
                    "WHERE e_roll='" + id + "'");
            ac = true;
        }

        if (!request.getParameter("n_pass").isEmpty()) {
            statement.executeUpdate("UPDATE e_login SET " +
                    "pass='" + request.getParameter("n_pass") + "' " +
                    "WHERE roll='" + id + "' AND pass='" + pass + "'");
            pass = request.getParameter("n_pass");
            pc = true;
        }
        connection.close();

    } catch (Exception e) {
        System.out.println(e);
    }
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
        <li><a href="eChanges.jsp?e_id=<%=id%>&e_pass=<%=pass%>">Employee Changes</a></li>
        <li><a href="#">Result</a></li>
    </ol>
    <%
        if (fnc) {%>
    <div class="row panel panel-success">
        <div class="panel-body text-center">
            First Name Updated
        </div>
    </div>
    <%
        }
        if (lnc) {%>
    <div class="row panel panel-success">
        <div class="panel-body text-center">
            Last Name Updated
        </div>
    </div>
    <%
        }
        if (ac) {
    %>
    <div class="row panel panel-success">
        <div class="panel-body text-center">
            Address Updated
        </div>
    </div>
    <%
        }
        if (pc) {
    %>
    <div class="row panel panel-success">
        <div class="panel-body text-center">
            Password Updated
        </div>
    </div>
    <%
        }
        if (!fnc && !lnc && !ac && !pc) {
    %>
    <div class="row panel panel-info">
        <div class="panel-body text-center">
            No Changes Made
        </div>
    </div>
    <%}%>
    <div class="well text-center text-uppercase">
        <h2>
            Return to the <a href="eDetails.jsp?e_id=<%=id%>&e_pass=<%=pass%>">details</a> page
        </h2>
    </div>
</div>
</body>
</html>
