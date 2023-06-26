//
//  PresentController.swift
//  Example
//
//  Created by 陈卓 on 2023/6/12.
//

import UIKit
import ThenTheme

/// 有导航栏控制器承载的 Prent 视图
class PresentController: UIViewController {

    lazy var textButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("展示", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(PresentController.showClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Present"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(PresentController.backClick))
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.orange,
        ]
        
        view.addSubview(textButton)
        NSLayoutConstraint.activate([
            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textButton.heightAnchor.constraint(equalToConstant: 50),
            textButton.widthAnchor.constraint(equalToConstant: 150),
            textButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
        apply(ExampleThemeConfig.self) {
            // $0.navigationController?.navigationBar.tintColor = $1.textColor
            $0.view.backgroundColor = $1.mainColor
            // $0.navigationController?.navigationbBarBackgroundColor = $1.navigationbBarBackgroundColor
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        observeTheme()
    }
    
    private func observeTheme() {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            ThenTheme.shared.current = ThemeConfigs.dark
        default:
            ThenTheme.shared.current = ThemeConfigs.light
        }
    }
    
    @objc func backClick() {
        self.dismiss(animated: true)
    }
    
    @objc func showClick() {
        self.navigationController?.pushViewController(ChangeController(), animated: true)
    }
}

extension UIViewController {

    var navigationbBarBackgroundColor: UIColor? {
        get { return navigationController?.navigationBar.barTintColor }
        set {
            guard let controller = (self as? UINavigationController) ?? navigationController else { return }
            if #available(iOS 13.0, *) {
                let appearance = controller.navigationBar.standardAppearance
                appearance.backgroundColor = newValue
                appearance.shadowColor = .clear
                controller.navigationBar.standardAppearance = appearance
                if #available(iOS 15.0, *) {
                    controller.navigationBar.scrollEdgeAppearance = appearance
                }
            } else {
                controller.navigationBar.barTintColor = newValue
            }
        }
    }
}

class ChangeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "😅"
        // view.backgroundColor = UIColor.systemBackground
        
        apply(ExampleThemeConfig.self) { controller, config in
//            UIView.transition(with: controller.view,
//                              duration: 0.25,
//                              options: [.curveEaseInOut, .transitionCrossDissolve],
//                              animations: {
//                controller.view.backgroundColor = config.mainColor
//            }, completion: nil)
            controller.view.backgroundColor = config.mainColor
            // $0.navigationController?.navigationBar.tintColor = $1.textColor
            // $0.navigationController?.navigationbBarBackgroundColor = $1.navigationbBarBackgroundColor
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.delay(1)
        if ThenTheme.shared.current?.identifier == ThemeConfigs.dark.identifier {
            ThenTheme.shared.current = ThemeConfigs.light
        } else {
            ThenTheme.shared.current = ThemeConfigs.dark
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            ThenTheme.shared.current = ThemeConfigs.dark
        default:
            ThenTheme.shared.current = ThemeConfigs.light
        }
    }
    
}

class BaseNaviController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apply(ExampleThemeConfig.self) {
            $0.navigationBar.tintColor = $1.textColor
            $0.navigationbBarBackgroundColor = $1.navigationbBarBackgroundColor
        }
    }

}

extension UIView {
    
    /// Delay Interaction  Enable
    func delay(_ time: TimeInterval) {
        isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.isUserInteractionEnabled = true
        }
    }
}
