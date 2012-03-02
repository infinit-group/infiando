<%@ page import="infiando.Event" %>
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
                            <li class="nav-header">Event</li>
                            <li class="active">
                                <a href="<g:createLink action="list"/>" class="list">
                                <i class="icon-plus icon-white"></i>
                                Event-Liste
                                </a>
                            </li>
                            <li>
                                <a href="<g:createLink action="create"/>" class="create">
                                    <i class="icon-plus"></i>
                                    Event anlegen
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
                                <b> <g:formatDate format="dd.MM.yyyy" date="${e.startDate}"/>
                                    <g:formatNumber
                                        number="${e.startTimeHour}" minIntegerDigits="2" formatName="number"
                                        format="##"/>:<g:formatNumber
                                        number="${e.startTimeMin}" minIntegerDigits="2" formatName="number"
                                        format="##"/> Uhr</b>
                                    <br/>

                                    ${e.locationName} ${e.city}
                                    [<i class="icon-map-marker"></i> <a
                                    onmouseover="javascript:getElementById('map-${e.id}').style.display = 'block';
                                    getElementById('teaser-${e.id}').style.display = 'none'"
                                    onmouseout="javascript:getElementById('map-${e.id}').style.display = 'none';
                                    getElementById('teaser-${e.id}').style.display = 'block'">Karte</a>]</td>
                        </tr>
                        <tr>
                            <td>
                                <img id="teaser-${e.id}" src="${e.teaserPicUrl}" width="300" style="padding: 15px 15px 15px 0; float:left"/>
                                <img id="map-${e.id}" style="display:none;padding: 15px 15px 15px 0; float:left"
                                     src="http://maps.google.com/maps/api/staticmap?sensor=false&zoom=15&size=250x250&maptype=roadmap&center=${URLEncoder.encode(e.location)}"/>
                            </td>
                            <td style="vertical-align: top">
                                <div style="padding-left: 10px; padding-top: 15px">
                                <p>${e.description}</p>


                                <g:form controller="ticketOrder" action="order" method="post" class="form-horizontal">


                                    <g:hiddenField name="event" value="${e.id}"/>

                                        <div>

                                            <button type="submit" class="btn btn-primary">
                                                <i class="icon-shopping-cart icon-white"></i>
                                                <g:if test="${e.price == 0}">kostenlos!</g:if><g:else><g:formatNumber
                                                    number="${e.price}" minIntegerDigits="0" formatName="number"
                                                    format="###"/>&euro;</g:else>
                                            </button>
                                        </div>
                                    </fieldset>
                                </g:form>

                                </div>
                            </td>
                        </tr>
                    </table>

                </div>



        </g:each>

    </section>





</div>
</body>


</html>
