public enum Texts {}


extension Texts {
    enum FirstScene {
        static var presentMainScreenButtonLable: String {
            return "Go to Main scene!"
        }
    }
}

extension Texts {
    enum MainScene {
        static var sightLabel: String {
            return "Triumphal Arch Paris"
        }
        
        static var gideDataLabel: String {
            return "Fast-Track and Audio Tour"
        }
        
        static var descriptionLabel: String {
            return """
            Sign in to have an easier access to you tours and tickets. No password needed - we'll send you authorisation code 😼
            """
        }
        
        static var greetingsLable: String {
            return "Hi!"
        }
        
        static var confirmButtonLable: String {
            return "Confirm and get code"
        }
        
        static var notYouLabel: String {
            return "Not your?"
        }
        
        static var signInLabel: String {
            return "Sign in an another person"
        }
        
        static var phoneNumberPlaceholder: String {
            return "000 000 00 00"
        }
    }
}


extension Texts {
    enum CountryCode {
        static var titleLable: String {
            return "Country code"
        }
        
        static var searchLabel: String {
            return "Search"
        }
        
        static var letterValue: String {
            return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
    }
}
