package infiando

import org.springframework.dao.DataIntegrityViolationException

class TicketOrderController {


    def ticketOrderService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def order() {

        println params
        def ticketOrder = new TicketOrder(params)

        Event event
        if (params.event) {
            event = Event.findById(params.event)
        }

        render(view: "create", model: [t: ticketOrder, e: event, events: Event.list(), participants: Participant.list() ])
    }


    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [InstanceList: TicketOrder.list(params), InstanceTotal: TicketOrder.count()]
    }


    def create() {
        redirect(action: "order", params: params)
    }


    def save(TicketOrderCommand cmd) {
        
        println params

        if (cmd.hasErrors()) {
            TicketOrder order = new TicketOrder(params)
            flash.message = message(code: 'default.error')
            redirect(action: 'order')
            return
        }

        TicketOrder order = ticketOrderService.createOrder(Event.findById(cmd.event), Participant.findById(cmd.participant))
        flash.message = "Bestellung erfolgreich!"
        render(view: "orderSuccess", model: [order: order])

    }

    def show() {
        def ticketOrderInstance = TicketOrder.get(params.id)
        if (!ticketOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "list")
            return
        }

        [ticketOrderInstance: ticketOrderInstance]
    }

    def edit() {
        def ticketOrderInstance = TicketOrder.get(params.id)
        if (!ticketOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "list")
            return
        }

        [ticketOrderInstance: ticketOrderInstance]
    }

    def update() {
        def ticketOrderInstance = TicketOrder.get(params.id)
        if (!ticketOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ticketOrderInstance.version > version) {
                ticketOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ticketOrder.label', default: 'TicketOrder')] as Object[],
                        "Another user has updated this TicketOrder while you were editing")
                render(view: "edit", model: [ticketOrderInstance: ticketOrderInstance])
                return
            }
        }

        ticketOrderInstance.properties = params

        if (!ticketOrderInstance.save(flush: true)) {
            render(view: "edit", model: [ticketOrderInstance: ticketOrderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), ticketOrderInstance.id])
        redirect(action: "show", id: ticketOrderInstance.id)
    }

    def delete() {
        def ticketOrderInstance = TicketOrder.get(params.id)
        if (!ticketOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ticketOrderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ticketOrder.label', default: 'TicketOrder'), params.id])
            redirect(action: "show", id: params.id)
        }
    }



}
