package infiando

import org.springframework.dao.DataIntegrityViolationException

class ParticipantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        if (params.id) {
            redirect(action: "show", params: params)
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [InstanceList: Participant.listOrderByLastName(params, order: "asc"), InstanceTotal: Participant.count()]
    }



    def create() {

        println params
        def participant = flash.participant ? flash.participant : new Participant(params)
        [participant: participant]

    }


    def save(ParticipantCommand cmd) {

        Participant participant
        if (cmd.hasErrors()) {
            flash.message = message(code: 'default.error')
            flash.participant = cmd
            redirect(action: "create")
            return
        }

        participant = new Participant(params)
        participant.save(flush: true, failOnError: true)

        flash.message = "Teilnehmer erfolgreich angelegt!"
        redirect(action: "list")

    }


    def show() {
        def participantInstance = Participant.get(params.id)
        if (!participantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "list")
            return
        }

        [participantInstance: participantInstance]
    }

    def edit() {
        def participantInstance = Participant.get(params.id)
        if (!participantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "list")
            return
        }

        [participantInstance: participantInstance]
    }

    def update() {
        def participantInstance = Participant.get(params.id)
        if (!participantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (participantInstance.version > version) {
                participantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'participant.label', default: 'Participant')] as Object[],
                        "Another user has updated this Participant while you were editing")
                render(view: "edit", model: [participantInstance: participantInstance])
                return
            }
        }

        participantInstance.properties = params

        if (!participantInstance.save(flush: true)) {
            render(view: "edit", model: [participantInstance: participantInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'participant.label', default: 'Participant'), participantInstance.id])
        redirect(action: "show", id: participantInstance.id)
    }

    def delete() {
        def participantInstance = Participant.get(params.id)
        if (!participantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "list")
            return
        }

        try {
            participantInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'participant.label', default: 'Participant'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
