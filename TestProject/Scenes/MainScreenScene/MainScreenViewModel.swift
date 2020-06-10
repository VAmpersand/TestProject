final class MainScreenViewModel {
    
    // weaver: networkService = NetworkService

    var router: MainScreenRouterProtocol!
    var parentRouter: Router!

    weak var controller: MainScreenControllerProtocol?
    private let dependencies: MainScreenViewModelDependencyResolver
    
    init(injecting dependencies: MainScreenViewModelDependencyResolver) {
        self.dependencies = dependencies
    }
}

// MARK: - MainScreenViewModelProtocol
extension MainScreenViewModel: MainScreenViewModelProtocol {
    func presentCountryCodeScene() {
        router.presentCountryCodeScene()
    }
    
    func presentConfirmNumberScene(with authMethod: String) {
        router.presentConfirmNumberScene(authMethod: authMethod)
    }
    
    func postUserData(_ userData: PostingUserData) {
        var parameters: [String : Any] = [PostingUserData.CodingKeys.id.rawValue : userData.id]
        if userData.phone != nil {
            parameters[PostingUserData.CodingKeys.phone.rawValue] = userData.phone
        }
        if userData.email != nil {
            parameters[PostingUserData.CodingKeys.email.rawValue] = userData.email
        }
        
        dependencies.networkService.postJSONData(with: parameters)
    }
}

