import UIKit

final class ModalPresentation { }

// MARK: - Presentation
extension ModalPresentation: Presentation {
    func present(_ controller: UIViewController,
                 from parentController: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?) {
        controller.modalPresentationStyle = .fullScreen
        parentController.present(controller, animated: animated, completion: completion)
    }

    func dismiss(from router: Router, to parentRouter: Router?, animated: Bool, completion: (() -> Void)?) {
        if parentRouter?.controller?.parent != nil {
            parentRouter?.controller?.dismiss(animated: animated, completion: completion)
        } else {
            router.controller?.dismiss(animated: animated, completion: completion)
        }
    }
}
