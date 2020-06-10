final class ConfirmNumberRouter: BaseRouter {

}

// MARK: - ConfirmNumberRouterProtocol
extension ConfirmNumberRouter: ConfirmNumberRouterProtocol {
    func handleClose() {
        dismissSelf(using: FadePresentation())
    }
}

