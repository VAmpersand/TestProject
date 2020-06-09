import UIKit

public final class LoginOptionsContainerView: UIView {
    public init() {
        super.init(frame: .zero)
        
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: LoginOptionsContainerDelegate?
    
    public lazy var anotherSignInLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.MainScene.anotherSignInTitle
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var triangleView: UIImageView = {
        let view = UIImageView()
        view.image = Icons.MainScene.triangleDown
        
        return view
    }()
    
    public lazy var loginOptionsViews: [LoginOptionsView] = {
        let views = LoginOptions.allCases.map(LoginOptionsView.init)
        views.forEach { loginOptionsView in
            loginOptionsView.onTap = { [weak self] loginOptions in
                self?.delegate?.selected(option: loginOptions)
            }
        }
        return views
    }()
}

    
private extension LoginOptionsContainerView {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        [
            anotherSignInLabel,
            triangleView,
        ].forEach { addSubview($0) }
        loginOptionsViews.forEach { addSubview($0) }
    }
    
    func constraintSubviews() {
        anotherSignInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        triangleView.snp.makeConstraints { make in
            make.top.equalTo(anotherSignInLabel.snp.bottom).offset(Constants.cgFloat.p10.rawValue)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p7.rawValue)
                make.width.equalTo(Constants.cgFloat.p15.rawValue)
        }
        
        for (index, loginOptionsView) in loginOptionsViews.enumerated() {
            loginOptionsView.snp.makeConstraints { make in
                make.height.equalTo(Constants.cgFloat.p50.rawValue)
                make.left.right.equalToSuperview().inset(Constants.cgFloat.p15.rawValue)
                
                if index == 0 {
                    make.top.equalTo(triangleView.snp.bottom).offset(Constants.cgFloat.p25.rawValue)
                } else {
                    make.top.equalTo(loginOptionsViews[index - 1].snp.bottom).offset(-Constants.cgFloat.p15.rawValue)
                }
                
                if index == loginOptionsViews.count - 1 {
                    make.bottom.equalToSuperview().inset(Constants.cgFloat.p30.rawValue)
                } else {
                    make.bottom.equalTo(loginOptionsViews[index + 1].snp.top).offset(-Constants.cgFloat.p15.rawValue)
                }
            }
        }
    }
}
