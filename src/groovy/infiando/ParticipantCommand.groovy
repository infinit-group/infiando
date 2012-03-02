package infiando

import grails.validation.Validateable

/**
 * 
 */
@Validateable
class ParticipantCommand {
    
    
    String email
    String firstName
    String lastName
    String profilePictureUrl
    
    static constraints = {
        email(email:  true, unique: true, blank: false, nullable: false)
        firstName(blank: false)
        lastName(blank: false)
        profilePictureUrl(url: true, blank: true)
    }
    
}
