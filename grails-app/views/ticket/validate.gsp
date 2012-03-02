<%@ page import="infiando.Ticket" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row-fluid">

    <section id="application-status" class="span2">
        <div class="well sidebar-nav">

            <ul class="nav nav-list">
                <li class="nav-header">Ticket</li>
                <li>
                    <a href="<g:createLink action="list"/>" class="list">
                        <i class="icon-plus"></i>
                        Ticket-Liste
                    </a>
                </li>
                <li class="active">
                    <a href="<g:createLink action="validate"/>" class="list">
                        <i class="icon-check icon-white"></i>
                        Ticket prüfen
                    </a>
                </li>
            </ul>

        </div>
    </section>


    <section id="main" class="span6">

        <h1 style="padding-bottom: 15px">Ticket prüfen</h1>
        
        <g:hasErrors bean="${t}">
            <ul class="errors" role="alert">
                <g:eachError bean="${t}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        
        <g:if test="${isValidated}">
            <g:if test="${isValid}">
                <div class="message" style="padding: 6px; border: 2px dotted green" role="status"><i class="icon-check"></i> ${flash.message}</div>
            </g:if>
            <g:else>
                <div class="message" style="padding: 6px; border: 2px dotted red" role="status"><i
                        class="icon-warning-sign"></i> ${flash.message}</div>
            </g:else>
        </g:if>


        <div id="validate-form" style="">
            <g:form action="validate" method="post">

                <f:field bean="t" property="ticketId"/>
                <f:field bean="t" property="lastName"/>

                <% /*
                <table style="padding: 6px">
                    <tr>
                        <td>Ticket ID: </td>
                        <td><g:textField name="ticketId" maxlength="100" value="${t?.ticketId}"/></td>
                    </tr>
                    <tr>
                        <td>Nachname:</td>
                        <td><g:textField name="lastName" value="${t?.lastName}"/></td>
                    </tr>
                </table>

                */ %>

                <button type="submit" class="btn btn-primary">
                    <i class="icon-check icon-white"></i>
                    Ticket prüfen
                </button>
            </g:form>
        </div>

    </section>

</div>

</body>
</html>
