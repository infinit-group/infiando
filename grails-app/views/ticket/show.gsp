
<%@ page import="infiando.Ticket" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>

    <div class="row-fluid">

        <section id="application-status" class="span3">
            <div class="well sidebar-nav">

                <ul class="nav nav-list">
                    <li class="nav-header">Ticket</li>
                    <li>
                        <a href="<g:createLink action="list"/>" class="list">
                            <i class="icon-plus"></i>
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


        <section id="main" class="span9" style="border: 5px double grey; padding: 20px">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:render template="ticket" model="${ticket}"/>

        </section>


        </div>

	</body>
</html>
