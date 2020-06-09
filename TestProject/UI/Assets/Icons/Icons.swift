import UIKit

public enum Icons { }

public extension Icons {
    enum CountryCode {
    
    }
}

public extension Icons {
    enum MainScene {
        static var triangleDown: UIImage {
            image(named: "triangleDown")
        }
    }
}

extension Icons {
    static func image(named name: String) -> UIImage {
        UIImage(named: name) ?? UIImage()
    }
}
