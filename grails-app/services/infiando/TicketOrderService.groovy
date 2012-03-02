package infiando

class TicketOrderService {
    
    
    def createOrder(Event event, Participant participant) {
        TicketOrder order = createSingleOrder()
        
        // create ticket
        // TODO use a TicketService
        Ticket ticket = new Ticket([event: event, participant: participant] )
        order.addToTickets(ticket)
        // als Vereinfachung wird hier noch angenommen, dass der Buchende auch derjenige ist, auf den das
        // Ticket ausgestellt werden soll
        order.orderedBy = participant

        order.save(flush: true, failOnError: true)

        order
    }
    

    private TicketOrder createSingleOrder() {

        TicketOrder order = new TicketOrder()
        order.orderId = UUID.randomUUID()
        order.orderDate = new Date()
        order
    }
}
