import UIKit

public final class MainScreenController: BaseController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupSelf()
        setupUserData(for: User())
    }
    
    override public  func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.layer.cornerRadius = 25
    }
    
    public var viewModel: MainScreenViewModelProtocol!
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 26)
        label.textAlignment = .center
        label.textColor = Colors.MintColor
        label.text = Texts.MainScene.greetingsLable
        
        
        return label
    }()
    
    private lazy var descreiptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Regula", size: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Texts.MainScene.descriptionLabel
        
        
        return label
    }()
    
    private lazy var countryCodeButton: CountryCodeButton = {
        let view = CountryCodeButton()
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
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        label.textAlignment = .right

        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.MainScene.signInLabel,
                        for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
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
        
        view.backgroundColor = .white
    }

    override func addSubviews() {
        super.addSubviews()
    [
        imageView,
        titleLabel,
        greetingsLabel,
        descreiptionLabel,
        countryCodeButton,
        confirmButton,
        signInStackView
        ].forEach { view.addSubview($0) }
    }

    override func constraintSubviews() {
        super.constraintSubviews()
        imageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.top.equalToSuperview().inset(Constants.Offsets.p30.rawValue)
            make.height.equalTo(imageView.snp.width).multipliedBy(0.55)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.top.equalTo(imageView.snp.bottom).offset(Constants.Offsets.p25.rawValue)
        }
        
        greetingsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Offsets.p30.rawValue)
        }
        
        descreiptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.top.equalTo(greetingsLabel.snp.bottom).offset(Constants.Offsets.p15.rawValue)
        }
        
        countryCodeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.top.equalTo(descreiptionLabel.snp.bottom).offset(Constants.Offsets.p50.rawValue)
            make.height.equalTo(Constants.Size.p40.rawValue)
            make.width.equalTo(Constants.Size.p60.rawValue)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.Offsets.p15.rawValue)
            make.bottom.equalTo(signInStackView.snp.top).offset(-Constants.Offsets.p25.rawValue)
            make.height.equalTo(Constants.Size.p50.rawValue)
        }
                
        signInStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.Offsets.p40.rawValue)
            make.height.equalTo(20)
        }
    }
}

// MARK: - Action
private extension MainScreenController {
    @objc func confirmButtonHendler() {
        
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
    }
}
