final class FirstScreenScene: BaseScene {

    // weaver: parentRouter <= Router

    // weaver: firstScreenRouter = FirstScreenRouter
    // weaver: firstScreenRouter.scope = .transient

    // weaver: firstScreenViewModel = FirstScreenViewModel
    // weaver: firstScreenViewModel.scope = .transient

    // weaver: firstScreenController = FirstScreenController
    // weaver: firstScreenController.scope = .transient

    init(injecting dependencies: FirstScreenSceneDependencyResolver) {
        let router = dependencies.firstScreenRouter
        let viewModel = dependencies.firstScreenViewModel
        let controller = dependencies.firstScreenController

        controller.viewModel = viewModel
        viewModel.router = router
        viewModel.parentRouter = dependencies.parentRouter
        viewModel.controller = controller

        super.init(viewController: controller,
                   router: router,
                   parentRouter: dependencies.parentRouter)
    }
}
