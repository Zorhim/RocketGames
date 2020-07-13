<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 01/07/2020
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <title>Rocket Games</title>
    <link rel="stylesheet" href="stile.css" type="text/css">

</head>

<body>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Home"/>
</jsp:include>

<aside>
        <c:choose>
            <c:when test="${utente == null}">
                <a>Login</a>
                        <card>
                            <form action="Login" method="post">
                                <input type="text" name="username" placeholder="Username"><br>
                                <input type="password" name="password" placeholder="Password"><br>
                                <input type="submit" value="Login">
                            </form>
                        </card>

                <a href="RegistrazioneForm">Registrazione</a>
            </c:when>
            <c:otherwise>
                <a style="font-weight: bolder">${utente.admin ? 'Admin' : 'Account'}</a><br>
                    <c:if test="${utente.admin}">
                       <a href="AdminCategoria">Aggiungi Categoria</a><br>
                        <a href="AdminProdotto">Aggiungi Prodotto</a><br>
                        <a href="todo">Ordini</a><br>
                        <a href="AdminUtenti">Utenti</a><br>
                        <hr style="margin:0px;">
                    </c:if>
                        ${utente.nome}<br>
                    <a href="todo">Profilo</a><br>
                    <a href="todo">I miei ordini</a>

                        <card>
                            <form action="Logout">
                                <input type="submit" value="Logout">
                            </form>
                        </card>
            </c:otherwise>
        </c:choose>
</aside>

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



<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
