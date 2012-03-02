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

	<body>
		<div class="row-fluid">
			<aside id="application-status" class="span3">
				<div class="well sidebar-nav">
					<h5>Application Status</h5>
					<ul>
						<li>App version: <g:meta name="app.version"/></li>
						<li>Grails version: <g:meta name="app.grails.version"/></li>
						<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
						<li>JVM version: ${System.getProperty('java.version')}</li>
						<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
						<li>Domains: ${grailsApplication.domainClasses.size()}</li>
						<li>Services: ${grailsApplication.serviceClasses.size()}</li>
						<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
					</ul>
					<h5>Installed Plugins</h5>
					<ul>
						<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</ul>
				</div>
			</aside>

			<section id="main" class="span9">

				<div class="hero-unit">

					<h1 style="padding-bottom: 15px">Willkommen bei <img style="margin-bottom:-13px;margin-left: -7px; margin-right: -5px;" src="${resource(dir: 'images', file: 'infiando-logo-not-inverted.png')}"
                                            alt="infiando"/>!</h1>

					<p><b>... und herzlich willkommen beim ersten Grails-Stammtisch 2012 in Hamburg!</b></p>

                    <p>&nbsp;</p>
					
					<p>infiando ist eine imaginäre Plattform zum Erstellen und Buchen von Veranstaltungen.<br/>
                    <!--Diese Anwendung wurde als kleiner Prototyp aufgesetzt und soll die Leistungsfähigkeit von Grails für kleine wie große Anwendungen aufzeigen.<br/>
                    <br/>
                    Als Design-Vorlage dienen das <a href="http://freeside.co/grails-fields">Fields plugin</a> im Zusammenspiel mit dem <a href="https://github.com/groovydev/twitter-bootstrap-grails-plugin">Twitter
					Bootstrap Resources plugin</a>, welches das CSS bereitstellt.
					-->
					</p>
				</div>
					
				<div class="row-fluid">
					
                    <g:set var="events2012" value="${Event.findAll().sort{e1,e2 -> e1.startDate <=> e2.startDate}}"/>
                    <g:set var="maps" value="[:]"/>
                    
					<div class="span8">
						<h2>Veranstaltungen 2012</h2>
						<ul class="nav nav-list">

							<g:each var="e" in="${events2012}">
								<li>
                                     <p>
                                         <g:formatDate format="dd.MM.yyyy" date="${e.startDate}"/>: <g:link action="list" controller="event" params="[id: e.id]">${e.name}</g:link> , ${e.locationName} ${e.city}
                                         [<a onmouseover="javascript:getElementById('map-${e.id}').style.display='block'"
                                             onmouseout="javascript:getElementById('map-${e.id}').style.display = 'none'">Karte</a>]
                                     </p>
                                </li>
							</g:each>
						</ul>
					</div>


					<div class="span4">
						<h2>Wo?</h2>
                        <g:each var="e" in="${events2012}">
                            <p style="display: none" id="map-${e.id}">
                                <img src="http://maps.google.com/maps/api/staticmap?sensor=false&zoom=15&size=250x250&maptype=roadmap&center=${URLEncoder.encode(e.location)}"/>
                            </p>
                        </g:each>
					</div>

				</div>

			</section>
		</div>
		
	</body>
</html>
