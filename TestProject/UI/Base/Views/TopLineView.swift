import UIKit

public class TopLineView: UIView{
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 2.5
        
        return view
    }()
}

private extension TopLineView {
    func setupSelf() {
        addSubviews()
        constraintSubviews()
    }
    
    func addSubviews() {
        addSubview(topLineView)
    }
    
    func constraintSubviews() {
        topLineView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
