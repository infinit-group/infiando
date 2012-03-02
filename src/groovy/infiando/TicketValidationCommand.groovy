package infiando

import grails.validation.Validateable

/**
 * 
@Validateable
 */
class TicketValidationCommand {
    
    String ticketId
    String lastName

    static constraints = {
        ticketId(blank: false)
        lastName(blank: false)
    }

    public boolean validate() {
        return true
    }

}
