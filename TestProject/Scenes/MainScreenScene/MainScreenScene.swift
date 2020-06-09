final class MainScreenScene: BaseScene {

    // weaver: parentRouter <= Router

    // weaver: mainScreenRouter = MainScreenRouter
    // weaver: mainScreenRouter.scope = .transient

    // weaver: mainScreenViewModel = MainScreenViewModel
    // weaver: mainScreenViewModel.scope = .transient

    // weaver: mainScreenController = MainScreenController
    // weaver: mainScreenController.scope = .transient

    init(injecting dependencies: MainScreenSceneDependencyResolver) {
        let router = dependencies.mainScreenRouter
        let viewModel = dependencies.mainScreenViewModel
        let controller = dependencies.mainScreenController

        controller.viewModel = viewModel
        viewModel.router = router
        viewModel.parentRouter = dependencies.parentRouter
        viewModel.controller = controller

        super.init(viewController: controller,
                   router: router,
                   parentRouter: dependencies.parentRouter)
    }
}
