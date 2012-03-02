package infiando

class Ticket {


    public Ticket() {
        ticketId = UUID.randomUUID()
    }
    
    String ticketId

    Participant participant
    Event event

    static constraints = {
        ticketId(nullable: false)
        participant(nullable: false)
        event(nullable: false)
    }

    def getQRCodeId() {
        return "${ticketId}__${participant?.name}__${event?.name}__${event?.startDate}"
    }
}
