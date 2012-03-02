package infiando

class TicketOrder {

    String orderId
    Date orderDate
    Participant orderedBy

    static hasMany = [tickets: Ticket]


    static constraints = {
        orderedBy(nullable: false)
    }




    def getTicketCount() {
        return tickets.size()
    }

    public String toString() {
        orderId ? orderId : "-1"
    }
}
