import UIKit

public class BaseSeparatorView: UIView{
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        return view
    }()
}

private extension BaseSeparatorView {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        addSubview(separatorView)
    }
    
    func constraintSubviews() {
        separatorView.snp.makeConstraints { make in
            make.right.left.centerY.equalToSuperview()
            make.height.equalTo(Constants.cgFloat.p0_5.rawValue)
        }
    }
}
