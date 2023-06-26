//
//  ExampleThemeConfig.swift
//  Example
//
//  Created by 陈卓 on 2023/5/29.
//

import UIKit
import ThenTheme

enum ThemStyle: String, CaseIterable {
    case light
    case dark
}

struct ThemeConfigs {
    static let light = ExampleThemeConfig(identifier: ThemStyle.light.rawValue,
                                          mainColor: UIColor.white,
                                          textColor: UIColor.black,
                                          buttonBackgroundColor: UIColor.clear,
                                          systemImage: "person.2",
                                          navigationbBarBackgroundColor: UIColor.blue.withAlphaComponent(0.5))
    
    static let dark = ExampleThemeConfig(identifier: ThemStyle.dark.rawValue,
                                          mainColor: UIColor.darkGray,
                                          textColor: UIColor.white,
                                          buttonBackgroundColor: UIColor.clear,
                                          systemImage: "shareplay",
                                         navigationbBarBackgroundColor: UIColor.red.withAlphaComponent(0.5))
}

struct ExampleThemeConfig: ThenThemeConfig {
    
    let identifier: String
    
    let mainColor: UIColor
    
    let textColor: UIColor
    
    let systemImage: String
    
    let buttonBackgroundColor: UIColor
    
    let navigationbBarBackgroundColor: UIColor
    
    init(identifier: String, mainColor: UIColor, textColor: UIColor, buttonBackgroundColor: UIColor, systemImage: String, navigationbBarBackgroundColor: UIColor) {
        self.identifier = identifier
        self.mainColor = mainColor
        self.textColor = textColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.systemImage = systemImage
        self.navigationbBarBackgroundColor = navigationbBarBackgroundColor
    }
    
}
