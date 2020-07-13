<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Risultati ricerca</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stile.css" type="text/css">
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="${param.q}"/>
</jsp:include>


    <c:forEach items="${prodotti}" var="prodotto">
        <section>
            <h2 class="titolo">
                <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><c:out value="${prodotto.nome}" /></a>
            </h2>
            <p>
                <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><img src="images/prodotti/<c:out value="${prodotto.id}"/>.jpg"></a>
                    <c:out value="${prodotto.descrizione}"/>
            <h4>Prezzo: <c:out value="${prodotto.prezzoEuro}" /> &euro;</h4>
            </p>
        </section>
    </c:forEach>

    <c:if test="${empty prodotti}">
        <h2 class="titolo">Nessun prodotto trovato.</h2>
    </c:if>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
