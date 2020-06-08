final class FirstScreenViewModel {

    var router: FirstScreenRouterProtocol!
    var parentRouter: Router!

    weak var controller: FirstScreenControllerProtocol?

//    private let dependencies: FirstScreenViewModelDependencyResolver
//
//    init(injecting dependencies: FirstScreenViewModelDependencyResolver) {
//        self.dependencies = dependencies
//    }
}

// MARK: - FirstScreenViewModelProtocol
extension FirstScreenViewModel: FirstScreenViewModelProtocol {
    func presentMainScreenScene() {
        router.presentMainScreen()
    }
}

