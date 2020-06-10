final class ConfirmNumberViewModel {
    
    // weaver: authMethod <= String

    var router: ConfirmNumberRouterProtocol!
    var parentRouter: Router!

    weak var controller: ConfirmNumberControllerProtocol?
    private let dependencies: ConfirmNumberViewModelDependencyResolver

    init(injecting dependencies: ConfirmNumberViewModelDependencyResolver) {
        self.dependencies = dependencies
    }
}

// MARK: - ConfirmNumberViewModelProtocol
extension ConfirmNumberViewModel: ConfirmNumberViewModelProtocol {
    func viewDidLoad() {
        controller?.setupData(authMethod: dependencies.authMethod)
    }
    
    func handleClose() {
        router.handleClose()
    }
}

