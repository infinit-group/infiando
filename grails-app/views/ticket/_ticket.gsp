<%@ page import="infiando.util.StringHelper; infiando.TicketValidationService" %>
<div class="ticket">
    <h1>${ticket.event.name}</h1>
    <h4>${ticket.event.location}, <g:formatNumber
            number="${ticket.event.startTimeHour}" minIntegerDigits="2" formatName="number"
            format="##"/>:<g:formatNumber
            number="${ticket.event.startTimeMin}" minIntegerDigits="2" formatName="number"
            format="##"/> Uhr</h4>

    <table width="100%" style="margin-top: 15px">
        <tr>
            <td>

            </td>

            <td></td>
        </tr>

        <tr>
            <td>
                <img src="${ticket.event.teaserPicUrl}" height="128"/>
                <br/>
            </td>

            <td style="vertical-align: top;">
                <g:set var="targetUrl" value="http://infiando.infinit.cloudbees.net/ticket/validateOnline?ticketId=${ticket.ticketId}&lastName=${StringHelper.removeNonWordCharacters(ticket.participant.lastName)}"/>

                <img src="/qrcode/text?text=${URLEncoder.encode(targetUrl)}&amp;s=192" width="192" height="192" dir="images"
                     style="float:right;border:1px solid black;overflow: visible;"/>
            </td>
        </tr>

        <tr>
            <td>
                powered by<br/>
                <img style="" src="${resource(dir: 'images', file: 'infiando-logo-not-inverted.png')}" alt="infiando"/>
            </td>

            <td>
                <h5>${ticket.ticketId}</h5>
                <br/>
                <h5>${ticket.participant.name}</h5>
                <h4>Preis: <g:if test="${ticket.event.price == 0}">kostenlos</g:if><g:else><g:formatNumber
                        number="${ticket.event.price.price}" minIntegerDigits="0" formatName="number"
                        format="###"/>&euro;</g:else></h4>
            </td>
        </tr>

    </table>
</div>