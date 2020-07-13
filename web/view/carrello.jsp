<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 18:34
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

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Carrello"/>
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
                <a href="AdminUtenti">Utenti</a><br>
                <hr style="margin:0px;">
            </c:if>
            ${utente.nome}<br>
            <form action="ModificaUtente" method="post">
                <input type="hidden" name="id" value="${utente.id}">
                <input type="submit" name="modifica" value="Modifica">
            </form><br>

            <card>
                <form action="Logout">
                    <input type="submit" value="Logout">
                </form>
            </card>
        </c:otherwise>
    </c:choose>
</aside>


<section>
    <h1>Carrello</h1>
    <grid>
        <c:forEach items="${carrello.prodotti}" var="pq">
            <h2 class="titolo">
                <a href="Prodotto?id=<c:out value="${pq.prodotto.id}"/>"><c:out value="${pq.prodotto.nome}" /></a>
            </h2>
            <p>
                <a href="Prodotto?id=<c:out value="${pq.prodotto.id}"/>"><img src="images/prodotti/<c:out value="${pq.prodotto.id}"/>.jpg"></a>
                    <c:out value="${pq.prodotto.descrizione}"/>
            <h4>Prezzo: <c:out value="${pq.prodotto.prezzoEuro}" /> &euro;</h4>
            </p>


                <h5>Quantità: ${pq.quantita}, Prezzo unit.: ${pq.prodotto.prezzoEuro} &euro;, Prezzo tot.: ${pq.prezzoTotEuro} &euro;</h5>


                <form action="Carrello" method="post">
                    <input type="hidden" name="prodId" value="${pq.prodotto.id}">
                    <input type="hidden" name="setNum" value="0">
                    <input type="submit" value="Rimuovi">
                </form>
            </div>


        </c:forEach>
        <c:if test="${empty carrello.prodotti}">
            <h2 class="titolo">Nessun prodotto nel carrello</h2>
        </c:if>
    </grid>
</section>
<c:if test="${not empty carrello.prodotti}">
    <section>
        <grid>
            <div col="1/3">
                <h2>Totale: ${carrello.prezzoTotEuro} &euro;</h2>
            </div>

            <div col="1/3">
                <form action="Acquisto">
                    <input type="submit" value="Completa acquisto">
                </form>
            </div>
        </grid>
    </section>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
