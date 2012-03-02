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
                        <i class="icon-plus icon-white"></i>
                        Bestellung anlegen
                    </a>
                </li>
            </ul>

        </div>
    </section>


    <section id="main" class="span8">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <% /*

        <g:if test="${e.price == 0}">kostenlos!</g:if><g:else><g:formatNumber
                    number="${e.price}" minIntegerDigits="0" formatName="number"
                    format="###"/>&euro;</g:else>

        */ %>

        <h1>Ticket bestellt!</h1>
        <br/>

        <g:form action="save" method="post">

            <g:hiddenField name="eventId" value="${e?.id}"/>

            <h3>Event</h3>
            <g:if test="${e}">
                <b>${e.name}</b> am <g:formatDate format="dd.MM.yyyy" date="${e.startDate}"/>
            </g:if>
            <g:else>
                <g:select name="event" from="${events}" optionValue="name" optionKey="id"/>
            </g:else>

            <br/><br/>

            <h3>Für Teilnehmer</h3>
            <g:select name="participant" from="${participants}" optionKey="id"/>

            <br/>

            <button type="submit" class="btn btn-primary">
                <i class="icon-shopping-cart icon-white"></i>
                bestellen
            </button>
        </g:form>

    </section>
</div>

</body>
</html>
