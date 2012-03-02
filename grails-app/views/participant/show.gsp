
<%@ page import="infiando.Participant" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'participant.label', default: 'Participant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-participant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-participant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list participant">
			
				<g:if test="${participantInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="participant.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${participantInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participantInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="participant.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${participantInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participantInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="participant.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${participantInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participantInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="participant.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${participantInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${participantInstance?.tickets}">
				<li class="fieldcontain">
					<span id="tickets-label" class="property-label"><g:message code="participant.tickets.label" default="Tickets" /></span>
					
						<g:each in="${participantInstance.tickets}" var="t">
						<span class="property-value" aria-labelledby="tickets-label"><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${participantInstance?.id}" />
					<g:link class="edit" action="edit" id="${participantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
