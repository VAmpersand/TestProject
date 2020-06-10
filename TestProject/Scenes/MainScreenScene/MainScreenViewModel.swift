final class MainScreenViewModel {

    var router: MainScreenRouterProtocol!
    var parentRouter: Router!

    weak var controller: MainScreenControllerProtocol?
}

// MARK: - MainScreenViewModelProtocol
 extension MainScreenViewModel: MainScreenViewModelProtocol {
    func presentCountryCodeScene() {
        router.presentCountryCodeScene()
    }
    
    func presentConfirmNumberScene(with phone: String) {
        router.presentConfirmNumberScene(phone: phone)
    }
}

