//
//  PushController.swift
//  Example
//
//  Created by 陈卓 on 2023/6/12.
//

import UIKit

class PushController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Push"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "展示", style: .plain, target: nil, action: nil)
        
        // 修改的是Item的颜色
        navigationController?.navigationBar.tintColor = UIColor.blue
        navigationController?.navigationBar.barTintColor = UIColor.green
        
        // 这个更改的导航栏标题文字的属性, 一旦更改, 当前导航栏下所有页面都会修改
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.purple,
        ]
        
        apply(ExampleThemeConfig.self) {
            $0.view.backgroundColor = $1.mainColor
        }
    }
    
}
