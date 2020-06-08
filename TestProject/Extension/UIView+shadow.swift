import UIKit

public extension UIView {
    func applyShadow(color: UIColor = .black,
                     alpha: Float = 1,
                     x: CGFloat,
                     y: CGFloat,
                     blur: CGFloat = 4) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur
    }

    func applyFirstShadow() {
        applyShadow(color: .black, alpha: 0.2, x: 0.5, y: 0.5, blur: 2)
    }
}
