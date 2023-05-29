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
        
        view.addSubview(textButton)
        NSLayoutConstraint.activate([
            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textButton.heightAnchor.constraint(equalToConstant: 50),
            textButton.widthAnchor.constraint(equalToConstant: 150),
            textButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
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
    
}

