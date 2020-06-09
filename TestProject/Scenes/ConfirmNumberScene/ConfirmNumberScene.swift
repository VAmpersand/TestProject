final class ConfirmNumberScene: BaseScene {

    // weaver: parentRouter <= Router
    
    // weaver: phone <= String

    // weaver: confirmNumberRouter = ConfirmNumberRouter
    // weaver: confirmNumberRouter.scope = .transient

    // weaver: confirmNumberViewModel = ConfirmNumberViewModel
    // weaver: confirmNumberViewModel.scope = .transient

    // weaver: confirmNumberController = ConfirmNumberController
    // weaver: confirmNumberController.scope = .transient

    init(injecting dependencies: ConfirmNumberSceneDependencyResolver) {
        let router = dependencies.confirmNumberRouter
        let viewModel = dependencies.confirmNumberViewModel(phone: dependencies.phone)
        let controller = dependencies.confirmNumberController

        controller.viewModel = viewModel
        viewModel.router = router
        viewModel.parentRouter = dependencies.parentRouter
        viewModel.controller = controller

        super.init(viewController: controller,
                   router: router,
                   parentRouter: dependencies.parentRouter)
    }
}
