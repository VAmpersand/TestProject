import UIKit
import SnapKit

final class MainRouter: BaseRouter {
    
    // weaver: mainScreenScene = MainScreenScene
    // weaver: mainScreenScene.scope = .transient

    private let dependencies: MainRouterDependencyResolver
    
    private var window: UIWindow!
    private var windowScene: UIWindowScene!
    
    init(injecting dependencies: MainRouterDependencyResolver) {
        self.dependencies = dependencies
        super.init()
    }
}

// MARK: - Starting app
extension MainRouter {
    func startApp(in scene: UIScene) {
        setupWindow(in: scene)
    }
        
    private func setupWindow(in scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else {
            fatalError("Failed to configure windowScene")
        }
        self.windowScene = windowScene
        let mainScreenScene = dependencies.mainScreenScene(parentRouter: self)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window.rootViewController = mainScreenScene.viewController
    }
}
