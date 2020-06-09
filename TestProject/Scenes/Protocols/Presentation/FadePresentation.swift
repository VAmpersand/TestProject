import UIKit

final class FadePresentation {
    init(fadeInDuration: TimeInterval = 0.3, fadeOutDuration: TimeInterval = 0.3) {
        self.fadeInDuration = fadeInDuration
        self.fadeOutDuration = fadeOutDuration
    }

    private let fadeInDuration: TimeInterval
    private let fadeOutDuration: TimeInterval
}

// MARK: - Presentation
extension FadePresentation: Presentation {
    func present(_ controller: UIViewController,
                 from parentController: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?) {
        controller.modalPresentationStyle = .overFullScreen
        controller.view?.alpha = 0
        let fadeInDuration = self.fadeInDuration

        parentController.present(controller, animated: false) {
            completion?()
            UIView.animate(withDuration: animated ? fadeInDuration : 0) {
                controller.view?.alpha = 1
            }
        }

    }

    func dismiss(from router: Router, to parentRouter: Router?, animated: Bool, completion: (() -> Void)?) {
        UIView.animate(withDuration: animated ? fadeOutDuration : 0, animations: {
            router.controller?.view?.alpha = 0
        }) { _ in
            router.controller?.dismiss(animated: false, completion: completion)
        }
    }
}
