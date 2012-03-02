<%@ page import="infiando.TicketOrder" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>Infiando</title>

    <script>
        $(document).ready(function () {
            // put all your jQuery goodness in here.
        });
    </script>

</head>


<body>

<div class="row-fluid">

    <section id="application-status" class="span2">
        <div class="well sidebar-nav">

            <ul class="nav nav-list">
                <li class="nav-header">Ticketbestellungen</li>
                <li>
                    <a href="<g:createLink action="list"/>" class="list">
                        <i class="icon-plus"></i>
                        Bestell-Listen
                    </a>
                </li>
                <li class="active">
                    <a href="<g:createLink action="create"/>" class="create">
                        <i class="icon-ok icon-white"></i>
                        Bestellung anlegen
                    </a>
                </li>
            </ul>

        </div>
    </section>


    <section id="main" class="span8">


        <h1>Ticket bestellt!</h1>
        <br/>

        <g:if test="${flash.message}">
            <div class="message success" role="status"><i class="icon-ok"></i> ${flash.message}</div>
        </g:if>

        Bitte notieren Sie sich die folgende Bestellnummer: <b>${order.orderId}</b>
        </p>


        <div id="order-overview">
            <p>Ihre Bestellung im Überblick:</p>

            <g:each in="${order.tickets}" var="t">

                <g:set var="e"       value="${t.event}"/>
                <g:set var="p" value="${t.participant}"/>

                <div class="hero-unit" style="padding-top: 10px !important;">

                <b>${e.name}</b> am <g:formatDate format="dd.MM.yyyy" date="${e.startDate}"/>
                für ${p.name} <g:link controller="ticket" action="show" class="btn btn-small" id="${t.id}">Ticket »</g:link>
                <br/>

                </div>
            </g:each>
        </div>

    </section>
</div>

</body>
</html>
