<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 13/07/2020
  Time: 15:36
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

<section>
    <table>
        <thead>
        <tr>
            <th>id</th>
            <th>Username</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Admin</th>
            <th>Ordini</th>
            <th>Azioni</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${utenti}" var="utente">
            <tr>
                <td>${utente.id}</td>
                <td>${utente.username}</td>
                <td>${utente.nome}</td>
                <td>${utente.email}</td>
                <td>${utente.admin ? "Si" : "No"}</td>
                <td>
                    <form action="AdminUtenti" method="post">
                        <input type="hidden" name="id" value="${utente.id}">
                        <input type="submit" name="modifica" value="Modifica">
                        <input type="submit" name="rimuovi" value="Rimuovi">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
