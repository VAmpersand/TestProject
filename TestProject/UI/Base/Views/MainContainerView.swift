import UIKit

public class MainContainerView: UIView{
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 25)
    }
}

private extension MainContainerView {
    func setupSelf() {
        backgroundColor = .white
    }
}
