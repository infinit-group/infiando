<%@ page import="infiando.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
		<title>Infiando</title>

        <script>
        $(document).ready(function() {
            // put all your jQuery goodness in here.
        });
        </script>


	</head>

<div class="row-fluid">

    <section id="application-status" class="span2">
        <div class="well sidebar-nav">

            <ul class="nav nav-list">
                            <li class="nav-header">Ticket</li>
                            <li class="active">
                                <a href="<g:createLink action="list"/>" class="list">
                                    <i class="icon-plus icon-white"></i>
                                    Ticket-Liste
                                </a>
                            </li>

                            <li>
                                <a href="<g:createLink action="validate"/>" class="list">
                                    <i class="icon-check"></i>
                                    Ticket prüfen
                                </a>
                            </li>
        </ul>

        </div>
    </section>




<section id="main" class="span10">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>




    <table class="table table-striped">
    <thead>
    <tr>
        <th></th>
        <g:sortableColumn property="ticketId" title="${message(code: 'ticket.ticketId.label', default: 'Ticket Id')}"/>
        <g:sortableColumn property="event.name" title="${message(code: 'ticket.ticketId.label', default: 'Event')}"/>
        <g:sortableColumn property="participant.name" title="${message(code: 'ticket.participant', default: 'Participant')}"/>
    </tr>
    </thead>
    <tbody>


    <g:each in="${InstanceList}" var="t">
        <tr>
            <td class="link">
                <g:link action="show" class="btn btn-small" id="${t.id}">Anzeigen »</g:link>
            </td>
            <td><g:link action="show" id="${t.id}">${fieldValue(bean: t, field: "ticketId")}</g:link></td>
            <td>${fieldValue(bean: t, field: "event.name")}</td>
            <td>${fieldValue(bean: t, field: "participant.name")}</td>
        </tr>
    </g:each>

    </tbody>
</table>


</section>





</div>
</body>

</html>
