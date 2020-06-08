import UIKit

public enum Icons { }

public extension Icons {
    enum CountryCode {
        static var searchLens: UIImage {
            image(named: "searchLens")
        }
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
