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
    <h5>${notifica}</h5>
        <form name="modifica" action="AdminUtente" method="post">
            <input type="hidden" name="id" value="${utente.id}">
            <label>Username (almeno 6 caratteri, solo lettere e numeri, non utilizzato da altri utenti)</label>
            <input type="text" name="username" oninput="validaUsername()"><br>
            <label>Password (almeno 8 caratteri, deve contenere: una lettera maiuscola, una minuscola, un numero)</label>
            <input type="password" name="password" oninput="validaPassword()"><br>
            <label>Password (conferma)</label>
            <input type="password" name="passwordConferma" oninput="validaPassword()"><br>
            <label>Nome (solo lettere e spazi)</label>
            <input type="text" name="nome" oninput="validaNome()"><br>
            <label>Email</label>
            <input type="text" name="email" oninput="validaEmail()"><br>
            <input name="Modificami" type="submit" value="Modifica"><span id="modicicamimessaggio"></span>
        </form>
</section>


<script>
    var borderOk = '2px solid #080';
    var borderNo = '2px solid #f00';
    var usernameOk = false;
    var passwordOk = false;
    var nomeOk = false;
    var emailOk = false;


    //Controlla se l'utente è già presente in database e se rispetta le regole di immissione
    function validaUsername() {
        var input = document.forms['modifica']['username'];
        if (input.value.length >= 6 && input.value.match(/^[0-9a-zA-Z]+$/)) {
            var xmlHttpReq = new XMLHttpRequest();
            xmlHttpReq.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200
                    && this.responseText == '<ok/>'){
                    usernameOk = true;
                    input.style.border = borderOk;
                } else {
                    input.style.border = borderNo;
                    usernameOk = false;
                }
                cambiaStatoRegistrami();
            }
            xmlHttpReq.open("GET", "VerificaUsername?username="
                + encodeURIComponent(input.value), true);
            xmlHttpReq.send();
        } else {
            input.style.border = borderNo;
            usernameOk = false;
            cambiaStatoRegistrami();
        }
    }

    //Controlla se la password rispetta le regole di immissione
    function validaPassword() {
        var inputpw = document.forms['modifica']['password'];
        var inputpwconf = document.forms['modifica']['passwordConferma'];
        var password = inputpw.value;
        if (password.length >= 8 && password.toUpperCase() != password
            && password.toLowerCase() != password && /[0-9]/.test(password)) {
            inputpw.style.border = borderOk;

            if (password == inputpwconf.value) {
                inputpwconf.style.border = borderOk;
                passwordOk = true;
            } else {
                inputpwconf.style.border = borderNo;
                passwordOk = false;
            }
        } else {
            inputpw.style.border = borderNo;
            inputpwconf.style.border = borderNo;
            passwordOk = false;
        }
        cambiaStatoRegistrami();
    }

    //Controlla se il nome rispetta le regole di immissione
    function validaNome() {
        var input = document.forms['modifica']['nome'];
        if (input.value.trim().length > 0
            && input.value.match(/^[ a-zA-Z\u00C0-\u00ff]+$/)) {
            input.style.border = borderOk;
            nomeOk = true;
        } else {
            input.style.border = borderNo;
            nomeOk = false;
        }
        cambiaStatoRegistrami();
    }

    //Controlla se l'email rispetta le regole di immissione
    function validaEmail() {
        var input = document.forms['modifica']['email'];
        if (input.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/)) {
            input.style.border = borderOk;
            emailOk = true;
        } else {
            input.style.border = borderNo;
            emailOk = false;
        }
        cambiaStatoRegistrami();
    }

    //Attiva il pulsante di registrazione se tutti i campi sono compilati correttamente
    function cambiaStatoRegistrami() {
        if (usernameOk && passwordOk && nomeOk && emailOk) {
            document.getElementById('Modificami').disabled = false;
            document.getElementById('modificamimessaggio').innerHTML = '';
        } else {
            document.getElementById('Modificami').disabled = true;
            document.getElementById('modificamimessaggio').innerHTML = 'Verifica che tutti i campi siano in verde.';
        }
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
