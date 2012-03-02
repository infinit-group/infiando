<%@ page import="infiando.Participant" %>



<div class="fieldcontain ${hasErrors(bean: participantInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="participant.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${participantInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="participant.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${participantInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="participant.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${infiando.Participant$Gender?.values()}" keys="${infiando.Participant$Gender.values()*.name()}" required="" value="${participantInstance?.gender?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="participant.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${participantInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: participantInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="participant.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${participantInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['participant.id': participantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>

</div>

