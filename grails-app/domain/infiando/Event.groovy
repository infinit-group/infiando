package infiando

class Event {

    String name
    
    String locationName
    String street
    String city
    
    String description
    
    Date startDate
    int startTimeHour
    int startTimeMin
    
    float price
    int maxParticipants
    
    String teaserPicUrl



    static hasMany = [tickets: Ticket]

    static mapping = {
        startDate sort: 'number', order: 'desc'
    }



    static constraints = {
        name(blank: false)
        locationName(blank: false)
        street(blank: false)
        city(blank: false)
        description(widget: 'textarea', blank: false)
        
        price(min: 0F)
        
        teaserPicUrl(url:  true, blank: true)
    }


    def getLocation() {
        "${locationName},${street},${city}"
    }
}
