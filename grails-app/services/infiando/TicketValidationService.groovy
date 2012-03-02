package infiando

import infiando.util.StringHelper as SH



class TicketValidationService {

    def validateTicket(String ticketId, String lastName) {

        Ticket t = Ticket.findByTicketId(ticketId)
        if (!t) {
            return null
        }

        boolean idsMatch = SH.removeNonWordCharacters(ticketId).equals(SH.removeNonWordCharacters(t.ticketId))
        boolean namesMatch = SH.removeNonWordCharacters(lastName).equals(SH.removeNonWordCharacters(t.participant.lastName))

        return idsMatch && namesMatch
    }

}
