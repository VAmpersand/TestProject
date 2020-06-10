import UIKit

public enum LoginOptions: CaseIterable {
    case phone
    case google
    case apple
    case facebook
}

public final class LoginOptionsView: UIView {
    public init(loginOptions: LoginOptions) {
        self.loginOptions = loginOptions
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var loginOptions: LoginOptions
    
    public var onTap: ((LoginOptions) -> Void)?

    private lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.image = contents(for: loginOptions).logo
        
        return view
    }()

    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = contents(for: loginOptions).title
        
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        return button
    }()
}

private extension LoginOptionsView {
    func contents(for loginOptions: LoginOptions) -> (logo: UIImage, title: String) {
        switch loginOptions {
        case .phone: return (Icons.MainScene.phone,
                             Texts.MainScene.phone)
        case .google: return (Icons.MainScene.google,
                              Texts.MainScene.google)
        case .apple: return (Icons.MainScene.apple,
                             Texts.MainScene.apple)
        case .facebook: return (Icons.MainScene.facebook,
                                Texts.MainScene.facebook)
        }
    }
    
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        layer.cornerRadius = 12
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    func addSubviews() {
        [
            logoView,
            titleLabel,
            button,
        ].forEach { addSubview($0) }
    }

    func constraintSubviews() {
        logoView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
            make.width.equalTo(logoView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(logoView.snp.right)
            make.right.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - Action
private extension LoginOptionsView {
    @objc func handleButton() {
        onTap?(loginOptions)
    }
}

