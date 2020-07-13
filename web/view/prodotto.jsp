<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 19:31
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
    <jsp:param name="pageTitle" value="${prodotto.nome}"/>
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


<section>
    <grid>

        <div col="1/3">
            <img src="images/prodotti/${prodotto.id}.jpg">
        </div>

        <div col="1/3">
            <h3>${prodotto.nome}</h3>
            ${prodotto.descrizione}
        </div>

        <div col="1/3">
            <c:if test="${utente.admin}">
                <form action="AdminProdotto" method="post">
                    <input type="hidden" name="id" value="${prodotto.id}">
                    <input type="submit" value="Modifica">
                    <input type="submit" name="rimuovi" value="Rimuovi">
                </form>
            </c:if>
            <p>Categorie:
                <c:forEach items="${prodotto.categorie}" var="categoria" varStatus="status">
                    <a href="Categoria?id=<c:out value="${categoria.id}"/>"><c:out value="${categoria.nome}" /></a><c:if test="${not status.last}">, </c:if>
                </c:forEach>
            </p><br>

            <h4>Prezzo: ${prodotto.prezzoEuro} &euro;</h4>
            <form action="Carrello" method="post">
                <label>Quantità:</label>
                <select name="addNum">
                    <c:forEach begin="1" end="30" varStatus="loop">
                        <option value="${loop.index}">${loop.index}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="prodId" value="${prodotto.id}">
                <input type="submit" value="Aggiungi al carrello">
            </form>
        </div>

    </grid>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
