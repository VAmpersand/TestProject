final class ConfirmNumberViewModel {
    
    // weaver: phone <= String

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
        controller?.setupPhone(phone: dependencies.phone)
    }
    
    
    func handleClose() {
        router.handleClose()
    }
}

