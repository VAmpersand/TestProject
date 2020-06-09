final class ConfirmNumberRouter: BaseRouter {
    
//    private let dependencies: ConfirmNumberRouterDependencyResolver
//
//    init(injecting dependencies: ConfirmNumberRouterDependencyResolver) {
//        self.dependencies = dependencies
//        super.init()
//    }
}

// MARK: - ConfirmNumberRouterProtocol
extension ConfirmNumberRouter: ConfirmNumberRouterProtocol {
    func handleClose() {
        dismissSelf(using: ModalPresentation())
    }
}

