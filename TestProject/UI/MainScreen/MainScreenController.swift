import UIKit

public final class MainScreenController: BaseController {
    public var viewModel: MainScreenViewModelProtocol!
    
    private lazy var topLineView = TopLineView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = [
            Texts.MainScene.sightLabel,
            Texts.MainScene.gideDataLabel,
        ].joined(separator: ":\n")
        
        return label
    }()
    
    private lazy var greetingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 26)
        label.textAlignment = .center
        label.textColor = Colors.MintColor
        label.text = Texts.MainScene.greetingsLable
        
        return label
    }()
    
    private lazy var descreiptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Texts.MainScene.descriptionLabel
        
        return label
    }()
    
    private lazy var phoneNumberView: PhoneNumberView = {
        let view = PhoneNumberView()
        view.countryCodeButton.addTarget(self,
                                         action: #selector(presentCountryCodeScene), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var confirmButton: BaseMainButton = {
           let button = BaseMainButton()
           button.setTitle(Texts.MainScene.confirmButtonLable,
                           for: .normal)
           button.addTouchUpInsideTarget(self,
                                         action: #selector(confirmButtonHendler))
           
           return button
    }()
    
    
    private lazy var notYouLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.MainScene.notYouLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right

        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.MainScene.signInLabel,
                        for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.MintColor,
                             for: .normal)
        button.titleLabel?.textAlignment = .left
        button.addTarget(self,
                         action: #selector(signInButtonHendler),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signInStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 6
        stackView.axis = .horizontal
        [
            notYouLabel,
            signInButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        stackView.backgroundColor = .red
        
        return stackView
    }()
}

extension MainScreenController {
    override func setupSelf() {
        super.setupSelf()
        addSubviews()
        constraintSubviews()
        setupUserData(for: User())
    }

    override func addSubviews() {
        super.addSubviews()
        view.addSubview(topLineView)
        view.addSubview(containerView)
    [
        imageView,
        titleLabel,
        greetingsLabel,
        descreiptionLabel,
        phoneNumberView,
        confirmButton,
        signInStackView,
    ].forEach { containerView.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        containerView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(Constants.cgFloat.p10.rawValue)
        }
        
        topLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(containerView).offset(-Constants.cgFloat.p15.rawValue)
            make.height.equalTo(Constants.cgFloat.p5.rawValue)
            make.width.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalToSuperview().inset(Constants.cgFloat.p30.rawValue)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.55)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalTo(imageView.snp.bottom).offset(Constants.cgFloat.p25.rawValue)
        }
        
        greetingsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.cgFloat.p30.rawValue)
        }
        
        descreiptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p25.rawValue)
            make.top.equalTo(greetingsLabel.snp.bottom).offset(Constants.cgFloat.p15.rawValue)
        }
        
        phoneNumberView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.top.equalTo(descreiptionLabel.snp.bottom).offset(Constants.cgFloat.p50.rawValue)
            make.height.equalTo(Constants.cgFloat.p40.rawValue)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.bottom.equalTo(signInStackView.snp.top).offset(-Constants.cgFloat.p25.rawValue)
            make.height.equalTo(Constants.cgFloat.p50.rawValue)
        }
                
        signInStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(20)
        }
    }
}

// MARK: - Action
private extension MainScreenController {
    @objc func confirmButtonHendler() {
        guard let phoneBody = phoneNumberView.phoneNumberField.text,
            let code = phoneNumberView.codeLabel.text else { return }
        
        viewModel.presentConfirmNumberScene(phone: code + phoneBody)
    }
    
    @objc func signInButtonHendler() {
        
    }
    
    @objc func presentCountryCodeScene() {
        viewModel.presentCountryCodeScene()
    }
    
}

// MARK: - TeamShiftsControllerProtocol
extension MainScreenController: MainScreenControllerProtocol {
    public func setupUserData(for user: User) {
        greetingsLabel.text = [Texts.MainScene.greetingsLable,
                               user.name].joined(separator: " ") + "!"
        phoneNumberView.codeLabel.text = user.code
        phoneNumberView.phoneNumberField.text = user.phone
        let curentData = countriesData.first { data -> Bool in
            data.code == user.code
        }
        phoneNumberView.flagView.text = curentData?.flag
    }
}
