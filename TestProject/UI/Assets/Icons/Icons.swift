import UIKit

public enum Icons { }

public extension Icons {
    enum MainScene {
        static var triangleDown: UIImage {
            image(named: "triangleDown")
        }
        
        static var phone: UIImage {
            image(named: "logo_phone")
        }
        
        static var google: UIImage {
            image(named: "logo_google")
        }
        
        static var apple: UIImage {
            image(named: "logo_apple")
        }
        
        static var facebook: UIImage {
            image(named: "logo_facebook")
        }
    }
}
    
extension Icons {
    static func image(named name: String) -> UIImage {
        UIImage(named: name) ?? UIImage()
    }
}
