<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<html>
<head>
    <title>Errore</title>
    <jsp:include page="header.jsp">
        <jsp:param name="pageTitle" value="Errore ${requestScope['javax.servlet.error.status_code']}"/>
    </jsp:include>
</head>
<body>
<pre>${requestScope['javax.servlet.error.exception']}</pre>
<jsp:include page="header.jsp"></jsp:include>
</body>
</html>
