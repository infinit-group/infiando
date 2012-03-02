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

    <section id="application-status" class="span2">
        <div class="well sidebar-nav">

            <ul class="nav nav-list">
                            <li class="nav-header">Teilnehmer</li>
                            <li class="active">
                                <a href="<g:createLink action="list"/>" class="list">
                                    <i class="icon-list icon-white"></i>
                                    Teilnehmer-Liste
                                </a>
                            </li>
                            <li class="">
                                <a href="<g:createLink action="create"/>" class="list">
                                    <i class="icon-plus"></i>
                                    Teilnehmer hinzufügen
                                </a>
                            </li>
            </ul>

        </div>
    </section>




<section id="main" class="span8">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>




    <g:each in="${InstanceList}" status="s" var="e">

        <div class="hero-unit" style="padding-top: 10px !important;">
            <h2>${e.name}</h2>

            <table>
                <tr>
                    <td>
                        <img id="teaser-${e.id}" src="${e.profilePictureUrl}" height="150"
                             style="padding: 15px 15px 15px 0; float:left: left; max-height: 150px !important;"/>
                    </td>
                    <td style="vertical-align: top">
                        <p style="padding-top: 15px">${e.email}</p>


                    </td>
                </tr>
            </table>

        </div>

    </g:each>

</section>





</div>
</body>


</html>
