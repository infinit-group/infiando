package infiando

class Participant {

    enum Gender {
        MALE, FEMALE



        public String getKey() {
            return this.key
        }
    }

    Gender gender
    String firstName
    String lastName
    String email

    String profilePictureUrl

    static hasMany = [tickets: Ticket]

    static constraints = {
        email (email: true, unique: true)
        firstName(minSize: 2)
        lastName(minSize: 3)
        profilePictureUrl(url: true, blank: true, nullable: true)
    }
    

    def getName() {
        "${firstName} ${lastName}"
    }

    public String toString() {
        return getName()
    }


    def setGender(String gender) {
        this.gender = Gender.valueOf(gender.toUpperCase())
    }

}
