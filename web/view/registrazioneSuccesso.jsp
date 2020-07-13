<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>

<head>
    <title>Rocket Games</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stile.css" type="text/css">

</head>

<body>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Registrazione avvenuta con successo."/>
</jsp:include>

<section>
    <h2>Registrazione avvenuta con successo.</h2>
    <h3>Puoi navigare il sito utilizzando il menu in alto.</h3>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>