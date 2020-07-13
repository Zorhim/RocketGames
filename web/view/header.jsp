<%--
  Created by IntelliJ IDEA.
  User: scarp
  Date: 01/07/2020
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<script src="ricerca.js"></script>

<html>
<head>
    <style>
        #ricerca{
            margin-top: 15px;
            margin-bottom: 0px;
            font-size:16px;
            border-width:2px;
            border-color:#cccccc;
            border-style:double;
            border-radius:13px;
            padding:2px;
        }

    </style>
    <title>Header</title>
</head>
<body>

<header>
    <h1>
        <ul>
            <li><a href="./"> HOME </a></li>
            <li>
                <form action="Ricerca" method="get">
                    <input id="ricerca" type="text" name="q" list="ricerca-datalist" placeholder="Ricerca" onkeyup="ricerca(this.value)" value="<c:out value="${param.q}" />">
                    <datalist id="ricerca-datalist"></datalist>
                </form>
            </li>
            <li id="login"><div class="dropdown">
                <button class="dropbtn">Utente
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="#"> <c:choose>
                        <c:when test="${utente == null}">
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
                    </c:choose></a>

                </div>
            </div> </li>

            <li></li>
        </ul>
    </h1>

</header>
</body>
</html>
