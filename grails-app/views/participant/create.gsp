<%@ page import="infiando.Participant" %>
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

    <section id="application-status" class="span3">
        <div class="well sidebar-nav">

            <ul class="nav nav-list">
                            <li class="nav-header">Teilnehmer</li>
                            <li class="">
                                <a href="<g:createLink action="list"/>" class="list">
                                <i class="icon-list"></i>
                                Teilnehmer-Liste
                                </a>
                            </li>
                            <li class="active">
                                <a href="<g:createLink action="create"/>" class="list">
                                <i class="icon-plus icon-white"></i>
                                    Teilnehmer hinzufügen
                                </a>
                            </li>
            </ul>

        </div>
    </section>




<section id="main" class="span9">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${participant}">
        <ul class="errors" role="alert">
            <g:eachError bean="${participant}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <h1>Teilnehmer hinzufügen</h1>


    <div style="padding-top: 15px">
    <g:form action="save" method="post">

        <g:select name="gender" from="${Participant.Gender.values()}"/>

        <f:field bean="participant" property="firstName"/>
        <f:field bean="participant" property="lastName"/>
        <f:field bean="participant" property="email"/>
        <f:field bean="participant" property="profilePictureUrl"/>


        <button type="submit" class="btn btn-primary">
            <i class="icon-plus icon-white"></i>
            Anlegen
        </button>
    </g:form>
    </div>





</section>





</div>
</body>


</html>
