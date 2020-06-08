/// This file is generated by Weaver 0.12.3
/// DO NOT EDIT!
import Foundation
import SnapKit
import UIKit
// MARK: - FirstScreenRouter
protocol FirstScreenRouterDependencyResolver {
    func mainScreenScene(parentRouter: Router) -> MainScreenScene
}
final class FirstScreenRouterDependencyContainer: FirstScreenRouterDependencyResolver {
    func mainScreenScene(parentRouter: Router) -> MainScreenScene {
        let dependencies = MainScreenSceneDependencyContainer(parentRouter: parentRouter)
        let value = MainScreenScene(injecting: dependencies)
        return value
    }
    init() {
    }
}
// MARK: - FirstScreenScene
protocol FirstScreenSceneDependencyResolver {
    var parentRouter: Router { get }
    var firstScreenRouter: FirstScreenRouter { get }
    var firstScreenViewModel: FirstScreenViewModel { get }
    var firstScreenController: FirstScreenController { get }
}
final class FirstScreenSceneDependencyContainer: FirstScreenSceneDependencyResolver {
    let parentRouter: Router
    var firstScreenRouter: FirstScreenRouter {
        let value = FirstScreenRouter(injecting: FirstScreenRouterDependencyContainer())
        return value
    }
    var firstScreenViewModel: FirstScreenViewModel {
        let value = FirstScreenViewModel()
        return value
    }
    var firstScreenController: FirstScreenController {
        let value = FirstScreenController()
        return value
    }
    init(parentRouter: Router) {
        self.parentRouter = parentRouter
    }
}
// MARK: - CountryCodeScene
protocol CountryCodeSceneDependencyResolver {
    var parentRouter: Router { get }
    var countryCodeRouter: CountryCodeRouter { get }
    var countryCodeViewModel: CountryCodeViewModel { get }
    var countryCodeController: CountryCodeController { get }
}
final class CountryCodeSceneDependencyContainer: CountryCodeSceneDependencyResolver {
    let parentRouter: Router
    var countryCodeRouter: CountryCodeRouter {
        let value = CountryCodeRouter()
        return value
    }
    var countryCodeViewModel: CountryCodeViewModel {
        let value = CountryCodeViewModel()
        return value
    }
    var countryCodeController: CountryCodeController {
        let value = CountryCodeController()
        return value
    }
    init(parentRouter: Router) {
        self.parentRouter = parentRouter
    }
}
// MARK: - MainScreenRouter
protocol MainScreenRouterDependencyResolver {
    func countryCodeScene(parentRouter: Router) -> CountryCodeScene
}
final class MainScreenRouterDependencyContainer: MainScreenRouterDependencyResolver {
    func countryCodeScene(parentRouter: Router) -> CountryCodeScene {
        let dependencies = CountryCodeSceneDependencyContainer(parentRouter: parentRouter)
        let value = CountryCodeScene(injecting: dependencies)
        return value
    }
    init() {
    }
}
// MARK: - MainScreenScene
protocol MainScreenSceneDependencyResolver {
    var parentRouter: Router { get }
    var mainScreenRouter: MainScreenRouter { get }
    var mainScreenViewModel: MainScreenViewModel { get }
    var mainScreenController: MainScreenController { get }
}
final class MainScreenSceneDependencyContainer: MainScreenSceneDependencyResolver {
    let parentRouter: Router
    var mainScreenRouter: MainScreenRouter {
        let value = MainScreenRouter(injecting: MainScreenRouterDependencyContainer())
        return value
    }
    var mainScreenViewModel: MainScreenViewModel {
        let value = MainScreenViewModel()
        return value
    }
    var mainScreenController: MainScreenController {
        let value = MainScreenController()
        return value
    }
    init(parentRouter: Router) {
        self.parentRouter = parentRouter
    }
}
// MARK: - MainRouter
protocol MainRouterDependencyResolver {
    func firstScreenScene(parentRouter: Router) -> FirstScreenScene
}
final class MainRouterDependencyContainer: MainRouterDependencyResolver {
    func firstScreenScene(parentRouter: Router) -> FirstScreenScene {
        let dependencies = FirstScreenSceneDependencyContainer(parentRouter: parentRouter)
        let value = FirstScreenScene(injecting: dependencies)
        return value
    }
    init() {
    }
}
// MARK: - SceneDelegate
protocol SceneDelegateDependencyResolver {
    var mainRouter: MainRouter { get }
}
final class SceneDelegateDependencyContainer: SceneDelegateDependencyResolver {
    private var _mainRouter: MainRouter?
    var mainRouter: MainRouter {
        if let value = _mainRouter { return value }
        let value = MainRouter(injecting: MainRouterDependencyContainer())
        _mainRouter = value
        return value
    }
    init() {
        _ = mainRouter
    }
}