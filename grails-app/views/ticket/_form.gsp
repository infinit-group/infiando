<%@ page import="infiando.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'participant', 'error')} required">
	<label for="participant">
		<g:message code="ticket.participant.label" default="Participant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="participant" name="participant.id" from="${infiando.Participant.list()}" optionKey="id" required="" value="${ticketInstance?.participant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="ticket.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${infiando.Event.list()}" optionKey="id" required="" value="${ticketInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'ticketId', 'error')} ">
	<label for="ticketId">
		<g:message code="ticket.ticketId.label" default="Ticket Id" />
		
	</label>
	<g:textField name="ticketId" value="${ticketInstance?.ticketId}"/>
</div>

