import UIKit

public final class FirstScreenController: BaseController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupSelf()

    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    public var viewModel: FirstScreenViewModelProtocol!
    
    private lazy var presentMainSceenButton: BaseMainButton = {
        let button = BaseMainButton()
        button.setTitle(Texts.FirstScene.presentMainScreenButtonLable,
                        for: .normal)
        button.addTouchUpInsideTarget(self,
                                      action: #selector(presentMainScreen))
        
        return button
    }()
}

extension FirstScreenController {
    override func setupSelf() {
        super.setupSelf()
        
        view.backgroundColor = .white
    }

    override func addSubviews() {
        super.addSubviews()
        view.addSubview(presentMainSceenButton)
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        presentMainSceenButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(Constants.Size.p50.rawValue)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}

// MARK: - Action
private extension FirstScreenController {
    @objc func presentMainScreen() {
        viewModel.presentMainScreenScene()
    }
}

// MARK: - FirstShiftsControllerProtocol
extension FirstScreenController: FirstScreenControllerProtocol {
    
}
