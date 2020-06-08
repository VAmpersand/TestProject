final class FirstScreenRouter: BaseRouter {
    
    // weaver: mainScreenScene = MainScreenScene
    // weaver: mainScreenScene.scope = .transient
    
    private let dependencies: FirstScreenRouterDependencyResolver
    
    init(injecting dependencies: FirstScreenRouterDependencyResolver) {
        self.dependencies = dependencies
        super.init()
    }
}

// MARK: - FirstScreenRouterProtocol
extension FirstScreenRouter: FirstScreenRouterProtocol {
    func presentMainScreen() {
        let mainScreenScene = dependencies.mainScreenScene(parentRouter: self)
        present(mainScreenScene, using: PopoverPresentation())
    }
    
}

