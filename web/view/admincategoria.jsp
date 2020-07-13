<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 13/07/2020
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stile.css" type="text/css">
</head>
<body>
<c:set var="operazione" value="${param.rimuovi != null ? 'Rimozione' : (categoria == null ? 'Aggiungi' : 'Modifica')}"/>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="${operazione} categoria"/>
</jsp:include>

<section>
    <h1>${operazione} categoria</h1>
    <h5>${notifica}</h5>
    <c:if test="${param.rimuovi == null}">
        <form action="AdminCategoria" method="post">
            <input type="hidden" name="id" value="${categoria.id}">
            <label>Nome</label>
            <input type="text" name="nome" value="${categoria.nome}"><br>
            <label>Descrizione</label>
            <textarea name="descrizione">${categoria.descrizione}</textarea>
            <input type="submit" value="${operazione}">
            <c:if test="${categoria != null}">
                <input type="submit" name="rimuovi" value="Rimuovi">
            </c:if>
        </form>
    </c:if>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
