final class CountryCodeViewModel {

    var router: CountryCodeRouterProtocol!
    var parentRouter: Router!

    weak var controller: CountryCodeControllerProtocol?
}

// MARK: - CountryCodeViewModelProtocol
extension CountryCodeViewModel: CountryCodeViewModelProtocol {

}

