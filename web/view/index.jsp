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
    <p>
        Prova prova prova
    </p>
</aside>

<section>
    <h2 class="titolo">Prova</h2>
    <p>
        <img src="https://www.mezashite.net/wp-content/uploads/2020/06/aiparade029_premux_001_872.png">
        Include i giochi principali e i DLC:

        -Mafia: Definitive Edition ( 28/08/2020)
        -Mafia II: Definitive Edition (release 19/05/2020)
        -Mafia III: Definitive Edition ( release 19/05/2020)

        Mafia: Definitive Edition
        Scala i ranghi di una famiglia mafiosa nell'era del proibizionismo in quest'avventura ricreata da zero. Il tassista Tommy Angelo rimane invischiato nel mondo del crimine organizzato. Nonostante le remore verso la famiglia Salieri, ben presto capisce che la tentazione è troppo forte per resistere.

        Mafia II: Definitive Edition
        Impersona un gangster nell'epoca d'oro del crimine, in un'avventura rimasterizzata in alta definizione. L'eroe di guerra Vito Scaletta resta invischiato con la mafia per pagare i debiti di suo padre. Insieme al suo amico Joe, Vito cerca di dimostrare il proprio valore e scalare i ranghi della famiglia con crimini e conseguenze sempre più importanti.

        Mafia III: Definitive Edition
        Dopo anni di servizio in Vietnam, Lincoln Clay vede sterminare la sua famiglia adottiva, la mafia nera, dai gangster italiani. Lincoln costruisce una nuova famiglia sulle ceneri della precedente e va in cerca di vendetta.
    </p>
    <input type="button" class="carrello" value="Aggiungi al carrello"></input>
</section>

    <c:forEach items="${prodotti}" var="prodotto">
        <section>
            <h2 class="titolo">
                <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><c:out value="${prodotto.nome}" /></a>
            </h2>
        <p>
            <a href="Prodotto?id=<c:out value="${prodotto.id}"/>"><img src="images/prodotti/<c:out value="${prodotto.id}"/>.jpg"></a>
            <c:out value="${prodotto.descrizione}"/>
            <h4>Prezzo: <c:out value="${prodotto.prezzoEuro}" /> &euro;</h4>
            <input type="button" class="carrello" id="${prodotto.id}" value="Aggiungi al carrello"></input>
        </p>
        </section>
    </c:forEach>



<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
