<%@ page import="infiando.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="event.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${eventInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${eventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'locationName', 'error')} ">
	<label for="locationName">
		<g:message code="event.locationName.label" default="Location Name" />
		
	</label>
	<g:textField name="locationName" value="${eventInstance?.locationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'maxParticipants', 'error')} required">
	<label for="maxParticipants">
		<g:message code="event.maxParticipants.label" default="Max Participants" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="maxParticipants" required="" value="${fieldValue(bean: eventInstance, field: 'maxParticipants')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="event.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: eventInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="event.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${eventInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="event.street.label" default="Street" />
		
	</label>
	<g:textField name="street" value="${eventInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="event.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>

</div>

