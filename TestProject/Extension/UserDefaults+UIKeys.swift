import UIKit

extension UserDefaults {
    static var confirmSceneKeyboardPresented: Bool {
        get {
            UserDefaults.standard.bool(forKey: "confirmSceneKeyboardPresented")
        } set {
            UserDefaults.standard.set(newValue, forKey: "confirmSceneKeyboardPresented")
        }
    }
}
