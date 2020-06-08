import UIKit

public final class CountryCodeButton: UIView {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public lazy var countryCodeButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var triangleView: UIImageView = {
        let view = UIImageView()
        view.image = Icons.MainScene.triangleDown
        
        return view
    }()
    
    public lazy var flagView = UIView()
}

private extension CountryCodeButton {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        backgroundColor = .white
        layer.cornerRadius = 5
        applyFirstShadow()
    }
    
    func addSubviews() {
        [
            countryCodeButton,
            triangleView,
            flagView
        ].forEach { addSubview($0) }
    }
    
    func constraintSubviews() {
        countryCodeButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        triangleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(Constants.Offsets.p10.rawValue)
            make.width.equalTo(Constants.Size.p10.rawValue)
        }
        
        flagView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(Constants.Offsets.p10.rawValue)
            make.width.equalTo(Constants.Size.p20.rawValue)
        }
    }
}

