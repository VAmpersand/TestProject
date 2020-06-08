import UIKit

public final class FirstScreenController: BaseController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()

    }

    public var viewModel: FirstScreenViewModelProtocol!
}

private extension FirstScreenController {
    func setupSelf() {
        view.backgroundColor = .green

        addSubviews()
        constraintSubviews()
    }

    func addSubviews() {
      
    }

    func constraintSubviews() {
    
    }
}

// MARK: - FirstShiftsControllerProtocol
extension FirstScreenController: FirstScreenControllerProtocol {

}
