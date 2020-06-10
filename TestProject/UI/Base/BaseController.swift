import UIKit

public class BaseController: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupSelf()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension BaseController {
    @objc func setupSelf() {
        addSubviews()
        constraintSubviews()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    @objc func addSubviews() {

    }
    
    @objc func constraintSubviews() {

    }
}
