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
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="ricerca.js"></script>
<script type="text/javascript">

    $(document).ready(function () {

        $('#nav li').hover(
            function () {
                //mostra sottomenu
                $('ul', this).stop(true, true).delay(50).slideDown(100);

            },
            function () {
                //nascondi sottomenu
                $('ul', this).stop(true, true).slideUp(200);
            }
        );


    });

</script>

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
            padding:2px;}

        #nav ul{
            position: absolute;
            display: none;
            padding: 0;
        }

    </style>
    <title>Header</title>
</head>
<body>


<ul id="nav">
    <li class="first"><a href="./">Home</a></li>
    <li style="float: right"> <form action="Ricerca" method="get">
        <input id="ricerca" type="text" name="q" list="ricerca-datalist" placeholder="Ricerca" onkeyup="ricerca(this.value)" value="<c:out value="${param.q}" />">
        <datalist id="ricerca-datalist"></datalist>
    </form>
    </li>
    <li style="color: black"><a>Categorie</a>
        <ul style="display: none;background-color: whitesmoke;color: black">
            <c:forEach items="${categorie}" var="categoria">
                <li>
                    <a href="Categoria?id=<c:out value="${categoria.id}"/>"><c:out
                            value="${categoria.nome}" /></a></li>
            </c:forEach>
        </ul>
        <div class="clear"></div>
    </li>

    <li class="last"><a href="Carrello">Carrello</a></li>
    <li><a href="#" id="login">Utente</a>
        <ul style="display: none;color: black;background-color: whitesmoke">
            <li class="last"><c:choose>
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
            </c:choose></a></li>
        </ul>
        <div class="clear"></div>
    </li>
</ul>

<div class="clear"></div>

</body>
</html>
