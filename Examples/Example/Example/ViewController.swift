//
//  ViewController.swift
//  Example
//
//  Created by 陈卓 on 2023/5/29.
//

import UIKit
import ThenTheme

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    lazy var textButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("展示", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Root"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "嘿嘿", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.red,
        ]
        view.addSubview(textButton)
        NSLayoutConstraint.activate([
            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textButton.heightAnchor.constraint(equalToConstant: 50),
            textButton.widthAnchor.constraint(equalToConstant: 150),
            textButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
        // 当前
        observeTheme()
        
        // 刷新UI
        apply(ExampleThemeConfig.self) {
            $0.view.backgroundColor = $1.mainColor
            $0.label.textColor = $1.textColor
            // 按钮xib初始化为非default类别时无法直接刷新主题颜色适配
            $0.button.setTitleColor($1.textColor, for: .normal)
            $0.button.backgroundColor = $1.buttonBackgroundColor
            $0.textButton.setTitleColor($1.textColor, for: .normal)
            $0.imgview.image = UIImage(systemName: $1.systemImage)
            /// 判定当前
            if $1.identifier == ThemStyle.light.rawValue {
                print("Current Theme Light")
            } else {
                print("Current Theme Dark")
            }
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
    
    
    // MARK: - Actions
    @IBAction func pushClick(_ sender: UIButton) {
        navigationController?.pushViewController(PushController(), animated: true)
    }
    
    @IBAction func presentClick(_ sender: UIButton) {
        let vc = BaseNaviController(rootViewController: PresentController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
