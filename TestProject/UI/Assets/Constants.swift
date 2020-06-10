import UIKit

public enum Constants {}

extension Constants {
    enum cgFloat: CGFloat {
        case p0_5 = 0.5
        case p1 = 1
        case p5 = 5
        case p7 = 7
        case p8 = 8
        case p10 = 10
        case p15 = 15
        case p17 = 17
        case p20 = 20
        case p25 = 25
        case p30 = 30
        case p35 = 35
        case p40 = 40
        case p45 = 45
        case p50 = 50
        case p60 = 60
        case p65 = 65
        case p70 = 70
        case p80 = 80
        case p230 = 230
        case p250 = 250
        case p270 = 270
        case p300 = 300
        case p340 = 340
        case p345 = 345
        case p440 = 440
    }
    
    static func inputFieldOffsets() -> CGFloat{
        switch IPhone.screen {
        case .screen4inch, .screen4_7inch: return 25
        case .screen5_5inch: return 50
        case .screen5_8inch: return 80
        case .screen6_1and6_5inch: return 110
        }
    }
}
