final class CountryCodeScene: BaseScene {

    // weaver: parentRouter <= Router

    // weaver: countryCodeRouter = CountryCodeRouter
    // weaver: countryCodeRouter.scope = .transient

    // weaver: countryCodeViewModel = CountryCodeViewModel
    // weaver: countryCodeViewModel.scope = .transient

    // weaver: countryCodeController = CountryCodeController
    // weaver: countryCodeController.scope = .transient

    init(injecting dependencies: CountryCodeSceneDependencyResolver) {
        let router = dependencies.countryCodeRouter
        let viewModel = dependencies.countryCodeViewModel
        let controller = dependencies.countryCodeController

        controller.viewModel = viewModel
        viewModel.router = router
        viewModel.parentRouter = dependencies.parentRouter
        viewModel.controller = controller

        super.init(viewController: controller,
                   router: router,
                   parentRouter: dependencies.parentRouter)
    }
}
