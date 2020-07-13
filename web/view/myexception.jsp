<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stile.css" type="text/css">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Errore"/>
</jsp:include>
<section>
    <h1><%= exception.getMessage() %></h1>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>