<%@ page import="infiando.Event" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-event" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list event">

        <g:if test="${eventInstance?.city}">
            <li class="fieldcontain">
                <span id="city-label" class="property-label"><g:message code="event.city.label" default="City"/></span>

                <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${eventInstance}"
                                                                                        field="city"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="event.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}"
                                                                                               field="description"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.locationName}">
            <li class="fieldcontain">
                <span id="locationName-label" class="property-label"><g:message code="event.locationName.label"
                                                                                default="Location Name"/></span>

                <span class="property-value" aria-labelledby="locationName-label"><g:fieldValue bean="${eventInstance}"
                                                                                                field="locationName"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.maxParticipants}">
            <li class="fieldcontain">
                <span id="maxParticipants-label" class="property-label"><g:message code="event.maxParticipants.label"
                                                                                   default="Max Participants"/></span>

                <span class="property-value" aria-labelledby="maxParticipants-label"><g:fieldValue
                        bean="${eventInstance}" field="maxParticipants"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="event.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.price}">
            <li class="fieldcontain">
                <span id="price-label" class="property-label"><g:message code="event.price.label"
                                                                         default="Price"/></span>

                <span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${eventInstance}"
                                                                                         field="price"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.startDate}">
            <li class="fieldcontain">
                <span id="startDate-label" class="property-label"><g:message code="event.startDate.label"
                                                                             default="Start Date"/></span>

                <span class="property-value" aria-labelledby="startDate-label"><g:formatDate
                        date="${eventInstance?.startDate}"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.street}">
            <li class="fieldcontain">
                <span id="street-label" class="property-label"><g:message code="event.street.label"
                                                                          default="Street"/></span>

                <span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${eventInstance}"
                                                                                          field="street"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.tickets}">
            <li class="fieldcontain">
                <span id="tickets-label" class="property-label"><g:message code="event.tickets.label"
                                                                           default="Tickets"/></span>

                <g:each in="${eventInstance.tickets}" var="t">
                    <span class="property-value" aria-labelledby="tickets-label"><g:link controller="ticket"
                                                                                         action="show"
                                                                                         id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${eventInstance?.id}"/>
            <g:link class="edit" action="edit" id="${eventInstance?.id}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
