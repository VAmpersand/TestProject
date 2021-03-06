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
        
        static var emailPlaceholder: String {
            return "Your e-mail"
        }
        
        static var anotherSignInTitle: String {
            return "or use another way to sign in"
        }
        
        static var phone: String {
            return "Sign in with phone number"
        }
        
        static var google: String {
            return "Sign in with Google"
        }
        
        static var apple: String {
            return "Sign in with Apple"
        }
        
        static var facebook: String {
            return "Sign in with Facebook"
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
        
        static var saggestionsLabel: String {
            return "Saggestions"
        }
    }
}

extension Texts {
    enum ConfirmNumber {
        static var titleLable: String {
            return "Confirm your number"
        }
        
        static var descriptionLabel: String {
            return "Please enter 4-digit code We just sent to"
        }
        
        static var didNotGetLabel: String {
            return "Did'nt get a text."
        }
        
        static var sendButton: String {
            return "Send again"
        }
    }
}

