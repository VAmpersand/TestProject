/// This file is generated by Weaver 0.12.3
/// DO NOT EDIT!
import Foundation
import SnapKit
import UIKit
// MARK: - ConfirmNumberViewModel
protocol ConfirmNumberViewModelDependencyResolver {
    var phone: String { get }
}
final class ConfirmNumberViewModelDependencyContainer: ConfirmNumberViewModelDependencyResolver {
    let phone: String
    init(phone: String) {
        self.phone = phone
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
// MARK: - ConfirmNumberScene
protocol ConfirmNumberSceneDependencyResolver {
    var parentRouter: Router { get }
    var phone: String { get }
    var confirmNumberRouter: ConfirmNumberRouter { get }
    func confirmNumberViewModel(phone: String) -> ConfirmNumberViewModel
    var confirmNumberController: ConfirmNumberController { get }
}
final class ConfirmNumberSceneDependencyContainer: ConfirmNumberSceneDependencyResolver {
    let parentRouter: Router
    let phone: String
    var confirmNumberRouter: ConfirmNumberRouter {
        let value = ConfirmNumberRouter()
        return value
    }
    func confirmNumberViewModel(phone: String) -> ConfirmNumberViewModel {
        let dependencies = ConfirmNumberViewModelDependencyContainer(phone: phone)
        let value = ConfirmNumberViewModel(injecting: dependencies)
        return value
    }
    var confirmNumberController: ConfirmNumberController {
        let value = ConfirmNumberController()
        return value
    }
    init(parentRouter: Router, phone: String) {
        self.parentRouter = parentRouter
        self.phone = phone
    }
}
// MARK: - MainScreenRouter
protocol MainScreenRouterDependencyResolver {
    func countryCodeScene(parentRouter: Router) -> CountryCodeScene
    func confirmNumberScene(parentRouter: Router, phone: String) -> ConfirmNumberScene
}
final class MainScreenRouterDependencyContainer: MainScreenRouterDependencyResolver {
    func countryCodeScene(parentRouter: Router) -> CountryCodeScene {
        let dependencies = CountryCodeSceneDependencyContainer(parentRouter: parentRouter)
        let value = CountryCodeScene(injecting: dependencies)
        return value
    }
    func confirmNumberScene(parentRouter: Router, phone: String) -> ConfirmNumberScene {
        let dependencies = ConfirmNumberSceneDependencyContainer(parentRouter: parentRouter, phone: phone)
        let value = ConfirmNumberScene(injecting: dependencies)
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
    func mainScreenScene(parentRouter: Router) -> MainScreenScene
}
final class MainRouterDependencyContainer: MainRouterDependencyResolver {
    func mainScreenScene(parentRouter: Router) -> MainScreenScene {
        let dependencies = MainScreenSceneDependencyContainer(parentRouter: parentRouter)
        let value = MainScreenScene(injecting: dependencies)
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