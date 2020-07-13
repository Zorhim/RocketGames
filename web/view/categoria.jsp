<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 12/07/2020
  Time: 19:42
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
    <jsp:param name="pageTitle" value="${categoria.nome}"/>
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
    <c:if test="${!utente.admin}">
        <h1>${categoria.nome}</h1>
    </c:if>
    <c:if test="${utente.admin}">
        <form action="AdminCategoria" method="post">
            <h1>${categoria.nome}
                <input type="hidden" name="id" value="${categoria.id}">
                <input type="submit" value="Modifica">
                <input type="submit" name="rimuovi" value="Rimuovi">
            </h1>
        </form>
    </c:if>
    <p>${categoria.descrizione}</p>

    <p txt="r" fs="s">Ordine:
        <c:forEach items="${ord.values()}" var="o">
            <c:choose>
                <c:when test="${o == 'DEFAULT'}">
                    <c:set var="desc" value="default" />
                </c:when>
                <c:when test="${o == 'PREZZO_ASC'}">
                    <c:set var="desc" value="prezzo (crescente)" />
                </c:when>
                <c:when test="${o == 'PREZZO_DESC'}">
                    <c:set var="desc" value="prezzo (decrescente)" />
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${o == ord}">
                    <i>${desc}</i>
                </c:when>
                <c:otherwise>
                    <a href="?id=${param.id}&perpag=${perpag}&ord=${o}">${desc}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </p>
    <grid>
        <c:forEach items="${prodotti}" var="prodotto">

                <h2 class="titolo">
                    <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><c:out value="${prodotto.nome}" /></a>
                </h2>
                <p>
                    <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><img src="images/prodotti/<c:out value="${prodotto.id}"/>.jpg"></a>
                        <c:out value="${prodotto.descrizione}"/>
                <h4>Prezzo: <c:out value="${prodotto.prezzoEuro}" /> &euro;</h4>
                </p>

        </c:forEach>
        <c:if test="${empty prodotti}">
            <div col="1/1">Nessun prodotto nella categoria.</div>
        </c:if>
        <div col="1/3" style="background-color:#E8E8E8">
            Per pagina:
            <c:forEach items="${[10, 20, 50]}" var="pp">
                <c:choose>
                    <c:when test="${pp == perpag}">
                        <b>${pp}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="?id=${param.id}&perpag=${pp}&ord=${ord}">${pp}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <div col="2/3" txt="c" style="background-color:#E8E8E8">
            <a <c:if test="${pag > 1}">href="?id=${param.id}&pag=${pag - 1}&perpag=${perpag}&ord=${ord}"</c:if>>&larr; precendente</a>
            &emsp;
            <c:forEach begin="1" end="${npag}" varStatus="loop">
                <c:choose>
                    <c:when test="${loop.index == pag}">
                        <b>${loop.index}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="?id=${param.id}&pag=${loop.index}&perpag=${perpag}&ord=${ord}">${loop.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            &emsp;
            <a <c:if test="${pag < npag}">href="?id=${param.id}&pag=${pag + 1}&perpag=${perpag}&ord=${ord}"</c:if>>successiva &rarr;</a>
        </div>
    </grid>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
