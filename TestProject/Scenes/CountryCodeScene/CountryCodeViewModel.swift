final class CountryCodeViewModel {

    var router: CountryCodeRouterProtocol!
    var parentRouter: Router!

    weak var controller: CountryCodeControllerProtocol?

//    private let dependencies: FirstScreenViewModelDependencyResolver
//
//    init(injecting dependencies: FirstScreenViewModelDependencyResolver) {
//        self.dependencies = dependencies
//    }
}

// MARK: - CountryCodeViewModelProtocol
extension CountryCodeViewModel: CountryCodeViewModelProtocol {

}

