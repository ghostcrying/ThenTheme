//
//  ExampleThemeConfig.swift
//  Example
//
//  Created by 陈卓 on 2023/5/29.
//

import UIKit
import ThenTheme

struct ThemeConfigs {
    static let light = ExampleThemeConfig(identifier: "light",
                                          mainColor: UIColor.groupTableViewBackground,
                                          textColor: UIColor.black,
                                          buttonBackgroundColor: UIColor.clear,
                                          systemImage: "person.2")
    
    static let dark = ExampleThemeConfig(identifier: "dark",
                                          mainColor: UIColor.black,
                                          textColor: UIColor.white,
                                          buttonBackgroundColor: UIColor.clear,
                                          systemImage: "shareplay")
}

struct ExampleThemeConfig: ThenThemeConfig {
    
    let identifier: String
    
    let mainColor: UIColor
    
    let textColor: UIColor
    
    let systemImage: String
    
    let buttonBackgroundColor: UIColor
    
    init(identifier: String, mainColor: UIColor, textColor: UIColor, buttonBackgroundColor: UIColor, systemImage: String) {
        self.identifier = identifier
        self.mainColor = mainColor
        self.textColor = textColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.systemImage = systemImage
    }
    
}
