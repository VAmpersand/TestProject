import UIKit

public enum ScreenIPhone {
    case screen4inch
    case screen4_7inch
    case screen5_5inch
    case screen5_8inch
    case screen6_1and6_5inch
}

public class IPhone {
    static var screen: ScreenIPhone {
        switch UIScreen.main.bounds.height {
        case 0..<600: return .screen4inch
        case 600..<700: return .screen4_7inch
        case 700..<800: return .screen5_5inch
        case 800..<830: return .screen5_8inch
        default: return .screen6_1and6_5inch
        }
    }
}
