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

        view.layer.cornerRadius = 25
    }
    
    @objc func addSubviews() {

    }
    
    @objc func constraintSubviews() {

    }
}

extension BaseController {
    @discardableResult
    func addStaticNavigationBar(_ title: String) -> (navigationBar: StaticNavigationBar,
        leftButton: UIButton?,
        rightButton: UIButton?) {
            let bar = StaticNavigationBar(title: title)
            return addStaticNavigationBar(bar)
    }
    
    @discardableResult
    func addStaticNavigationBar(_ bar: StaticNavigationBar) -> (
        navigationBar: StaticNavigationBar,
        leftButton: UIButton?,
        rightButton: UIButton?
        ) {
            view.addSubview(bar)
            
            bar.snp.makeConstraints { make in
                make.right.left.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide)
            }
            
            return (bar, bar.leftButton, bar.rightButton)
    }
    
    
}


