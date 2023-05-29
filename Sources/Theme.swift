//
//  ThemeManager.swift
//  ThenTheme
//
//  Created by 陈卓 on 2023/5/29.
//

import Foundation

/// A marker protocol for theme
public protocol ThenThemeConfig {
    /// 唯一id
    var identifier: String { get }
}

extension ThenThemeConfig {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


/// Manager your current theme
public class ThenTheme {
    
    /// The singleton
    public static let shared = ThenTheme()
    
    /// This is the current theme. Set it at app launch and whenever you want
    /// to change theme
    public var current: ThenThemeConfig? {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.themeDidChange, object: self)
        }
    }
    
}

extension Notification.Name {
    static let themeDidChange = Notification.Name("Themes.ThemeDidChangeNotification")
}
