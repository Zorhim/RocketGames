<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 13/07/2020
  Time: 15:52
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
    <jsp:param name="pageTitle" value="Utenti"/>
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

<c:set var="operazione" value="${param.rimuovi != null ? 'Rimozione' : (prodotto == null ? 'Aggiungi' : 'Modifica')}"/>
<section>
    <h1>${operazione} prodotto</h1>
    <h5>${notifica}</h5>
    <c:if test="${param.rimuovi == null}">
        <form action="AdminProdotto" method="post">
            <input type="hidden" name="id" value="${prodotto.id}">
            <label>Categorie</label>
            <c:forEach items="${categorie}" var="categoria">
                <input type="checkbox" name="categorie" value="${categoria.id}" <c:if test="${prodotto.categorie.stream().anyMatch(c -> c.id == categoria.id).orElse(false)}">checked</c:if>><label>${categoria.nome}</label>
            </c:forEach>
            <label>Nome</label>
            <input type="text" name="nome" value="${prodotto.nome}">
            <label>Descrizione</label>
            <textarea name="descrizione">${prodotto.descrizione}</textarea><br>
            <label>Prezzo (cent):</label>
            <input type="number" name="prezzoCent" value="${prodotto.prezzoCent}">
            <input type="submit" value="${operazione}">
            <c:if test="${prodotto != null}">
                <input type="submit" name="rimuovi" value="Rimuovi">
            </c:if>
        </form>
    </c:if>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
