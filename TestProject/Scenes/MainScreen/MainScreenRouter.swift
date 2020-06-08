final class MainScreenRouter: BaseRouter {
    
    // weaver: countryCodeScene = CountryCodeScene
    // weaver: countryCodeScene.scope = .transient
    
    private let dependencies: MainScreenRouterDependencyResolver
    
    init(injecting dependencies: MainScreenRouterDependencyResolver) {
        self.dependencies = dependencies
        super.init()
    }
    
}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentCountryCodeScene() {
        let countryCodeScene = dependencies.countryCodeScene(parentRouter: self)
        present(countryCodeScene, using: PopoverPresentation())
    }
}

