package infiando

import grails.validation.Validateable

/**
 * 
 */
@Validateable
class TicketOrderCommand {

    Long participant
    Long event

    static constraints = {
        participant(nullable: false, validator: {val, obj -> Participant.findById(val) != null } )
        event(nullable: false, validator: {val, obj -> Event.findById(val) != null } )
    }
}
