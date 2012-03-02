<%@ page import="infiando.TicketOrder" %>
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
                <li class="nav-header">Ticketbestellungen</li>
                <li class="active">
                    <a href="<g:createLink action="list"/>" class="list">
                    <i class="icon-list icon-white"></i>
                    Bestell-Listen
                                        </a>
                                    </li>
                    <li>
                        <a href="<g:createLink action="create"/>" class="create">
                            <i class="icon-plus"></i>
                            Bestellung anlegen
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
            <g:sortableColumn property="orderId"
                              title="${message(code: 'order.orderId.label', default: 'Order Id')}"/>
            <g:sortableColumn property="orderDate"
                              title="${message(code: 'order.orderDate.label', default: 'Datum')}"/>
            <g:sortableColumn property="orderedBy.name"
                              title="${message(code: 'order.orderedBy.label', default: 'Besteller')}"/>
            <th># tickets</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${InstanceList}" var="t">
            <tr>
                <td class="link">
                    <g:link action="show" class="btn btn-small" id="${t.id}">Anzeigen »</g:link>
                </td>
                <td><g:link action="show" id="${t.id}">${fieldValue(bean: t, field: "orderId")}</g:link></td>

                <td>${fieldValue(bean: t, field: "orderDate")}</td>

                <td><g:link controller="participant" action="list" id="${t.orderedBy.id}">${fieldValue(bean: t, field: "orderedBy.name")}</g:link></td>

                <td>${fieldValue(bean: t, field: "ticketCount")}</td>
            </tr>
        </g:each>

        </tbody>
    </table>

</section>





</div>
</body>

</html>
