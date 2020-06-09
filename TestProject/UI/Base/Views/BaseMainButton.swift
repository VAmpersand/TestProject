import UIKit

public final class BaseMainButton: UIButton {
    public init() {
        super.init(frame: .zero)

        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTouchUpInsideTarget(_ target: Any?, action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
}

private extension BaseMainButton {
    func setupSelf() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        backgroundColor = Colors.MintColor
        tintColor = .white
        layer.cornerRadius = 12
    }
}
