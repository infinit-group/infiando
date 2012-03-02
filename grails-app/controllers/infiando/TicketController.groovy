package infiando

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import grails.converters.XML

class TicketController {

    def ticketValidationService
    static allowedMethods = [validateOnline: "GET", save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [InstanceList: Ticket.listOrderByEvent(params), InstanceTotal: Ticket.count()]
    }

    def create() {
        [ticketInstance: new Ticket(params)]
    }


    def validateOnline(String ticketId, String lastName) {

        def result = ["validationResult" :false, "ticket" : [:]]

        if (ticketId && lastName) {
            boolean isValid = ticketValidationService.validateTicket(params.ticketId, params.lastName)

            result.validationResult = isValid
            Ticket t = Ticket.findByTicketId(params.ticketId)
            result.ticket.ticketId = t.ticketId
            result.ticket.event = t.event.name
            result.ticket.date = t.event.startDate
            result.ticket.participant = t.participant.name
        }

        render result as XML
    }


    def validate(TicketValidationCommand cmd) {

        if (request.method.equalsIgnoreCase("GET") || flash.ticket) {
            render(view: "validate", model: [t: flash.ticket ? flash.ticket : new TicketValidationCommand()])
            return
        }

        if (cmd.hasErrors()) {
            flash.message = message(code: 'default.error')
            flash.ticket = cmd
            redirect(action: "validate")
            return
        }

        boolean isValid = ticketValidationService.validateTicket(cmd.ticketId, cmd.lastName)
        flash.message = isValid ? "Ihr Ticket ist gültig" : "Das Ticket scheint ungültig zu sein. Sind Ihre Angaben korrekt?"

        render(view: "validate", model: [t: cmd, isValid: isValid, isValidated: true])
    }


    def save() {
        def ticketInstance = new Ticket(params)
        if (!ticketInstance.save(flush: true)) {
            render(view: "create", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }

    def show() {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "list")
            return
        }

        [ticket: ticketInstance]
    }

    def edit() {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "list")
            return
        }

        [ticketInstance: ticketInstance]
    }

    def update() {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ticketInstance.version > version) {
                ticketInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ticket.label', default: 'Ticket')] as Object[],
                        "Another user has updated this Ticket while you were editing")
                render(view: "edit", model: [ticketInstance: ticketInstance])
                return
            }
        }

        ticketInstance.properties = params

        if (!ticketInstance.save(flush: true)) {
            render(view: "edit", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }

    def delete() {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ticketInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
