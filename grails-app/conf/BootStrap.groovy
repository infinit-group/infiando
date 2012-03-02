import infiando.*
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        Event stammtisch = new Event([ name: "Grails Stammtisch Hamburg",
                                locationName: "Gloria Bar", 
                                street: "Bellealliancestraße 31-33", city: "Hamburg",
                                description: "Nach zwei gelungen Abenden im letzten Jahr, nun der erste Versuch in 2012.",
                                teaserPicUrl: "http://www.softstairs.de/wp-content/uploads/2012/02/ggstammtisch.png",
                                startDate: Date.parse("dd-MM-yyyy", "01-03-2012"),
                                startTimeHour: 18,
                                startTimeMinute: 0,
                                price: 0,
                                maxParticipants: 50]
        ).save()


        Event jugHH = new Event([name: "Java User Group",
                locationName: "HAW",
                street: "Berliner Tor", city: "Hamburg",
                description: "Die JavaUserGroup hat auch an diesem Abend wieder interessante Referenten zu Themen aus der Java-Welt gewonnen.",
                teaserPicUrl: "http://www.jughh.org/download/attachments/983069/JUG_Button.gif",
                startDate: Date.parse("dd-MM-yyyy", "02-02-2012"),
                startTimeHour: 19,
                startTimeMinute: 0,
                price: 0,
                maxParticipants: 100]
        ).save()


        Event hafenGeb = new Event([name: "Hafengeburtstag",
                locationName: "Landungsbrücken",
                street: "Landungsbrücken", city: "Hamburg",
                description: "Das größte Hafenfest der Welt bietet ein abwechslungsreiches Programm für die ganze Familie.",
                teaserPicUrl: "http://www.bildarchiv-hamburg.de/hamburger_sammelsurium/02_geburtstag_hamburg_hafen/011_17504_parade_hafengeburtstag_hamburg.jpg",
                startDate: Date.parse("dd-MM-yyyy", "11-05-2012"),
                startTimeHour: 19,
                startTimeMinute: 30,
                price: 0,
                maxParticipants: 0]
        ).save()
        
        Event kdL = new Event([name: "Der König der Löwen Musical",
                locationName: "König der Löwen",
                street: "Norderelbstraße 6", city: "20457 Hamburg",
                description: "Erleben Sie das berühmte Disney Musical DER KÖNIG DER LÖWEN live in Hamburg und buchen Sie Ihr Wunsch-Ticket",
                teaserPicUrl: "http://www.hamburg-tourism.de/typo3temp/pics/Der_Koenig_der_Loewe_009db54e7c.jpg",
                startDate: Date.parse("dd-MM-yyyy", "20-07-2012"),
                startTimeHour: 19,
                startTimeMinute: 30,
                price: 90,
                maxParticipants: 2450]
        ).save()



        def david = new Participant([gender: Participant.Gender.MALE, firstName: "John David", lastName: "von Oertzen",
                email: "johndavid.vonoertzen@infinit-group.de", profilePictureUrl: "https://www.xing.com/img/users/2/d/c/e72d7ade5.5950915,2.jpg"
                ]
        ).save()
        def oliver = new Participant([gender: Participant.Gender.MALE, firstName: "Oliver", lastName: "Wahlen",
                email: "oliver.wahlen@infinit-group.de", profilePictureUrl: "https://www.xing.com/img/users/a/8/3/945385bc2.6749722,1.jpg"]
        ).save()
        def theo = new Participant([gender: Participant.Gender.MALE, firstName: "Theo", lastName: "Test",
                email: "theo.test@infinit-group.de", profilePictureUrl: "http://www.discounter-archiv.de/bilder/discounternews/logo-stiftung-warentest_test750.gif"]
        ).save()
        def thea = new Participant([gender: Participant.Gender.FEMALE, firstName: "Thea", lastName: "Tee",
                email: "thea.tee@infinit-group.de", profilePictureUrl: "http://www.hollic.de/wp-content/uploads/2012/01/Tee-+-Blueten-247x247.gif"]
        ).save()
        def capitain = new Participant([gender: Participant.Gender.MALE, firstName: "Kapitän", lastName: "Prüsse",
                email: "captain@infinit-group.de", profilePictureUrl: "http://www.jh-reisen.de/Fotos/Deutschland%20-%20Hamburg/Touristik/logo%20Kapitaen-Pruesse.jpg"]
        ).save(flush: true)


        Ticket davidsStammtischTicket   = new Ticket([participant: david,  event: stammtisch ]).save()
        Ticket oliversStammtischTicket = new Ticket([participant: oliver, event: stammtisch ]).save()
        Ticket theosStammtischTicket = new Ticket([participant: theo, event: stammtisch ]).save()


        Ticket davidsJUGTicket = new Ticket([participant: david, event: jugHH]).save()
        Ticket theasJUGTicket = new Ticket([participant: thea, event: jugHH]).save(flush: true)


        david.save()
        oliver.save()
        theo.save(flush: true)


        david.addToTickets(davidsStammtischTicket)
        david.addToTickets(davidsJUGTicket)
        oliver.addToTickets(oliversStammtischTicket)

        theo.addToTickets(theosStammtischTicket)
        thea.addToTickets(theasJUGTicket)



        TicketOrder order1 = new TicketOrder([orderedBy: david, tickets: [davidsStammtischTicket, oliversStammtischTicket], orderDate: Date.parse("dd-MM-yyyy", "29-02-2012"), orderId: "xxdedae8-54ab-4061-a5d7-fee7c67ea20d" ])
        order1.save(flush: true)

//        stammtisch.addToTickets(davidsStammtischTicket, oliversStammtischTicket, theosStammtischTicket)
//        jugHH.addToTickets(davidsJUGTicket, oliversJUGTicket, theosJUGTicket)



//        stammtisch.save()
//        jugHH.save()

    }


    def destroy = {
    }
}
