//
//  Compatible.swift
//  ThenTheme
//
//  Created by 陈卓 on 2023/5/29.
//

import Foundation

/// Anything that wants to use theme
@objc
public protocol ThemeCompatible: AnyObject {}

public extension ThemeCompatible {
    
    /// Specify the theme you want to use.
    /// This is called immediately and when current theme changes
    ///
    /// Usage
    /// ```
    /// textField.apply(MyTheme.self) {
    ///   $0.textColor = $1.mainColor
    ///   $0.font = $1.textFont
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - type: The type of your own theme
    ///   - apply: the function that gets called with (ThemeUser, ThemeConfig)
    func apply<T: ThenThemeConfig>(_ type: T.Type, apply: @escaping (Self, T) -> Void) {
        if let config = ThenTheme.shared.current as? T {
            apply(self, config)
        }
        
        themeHandler.mapping[String(describing: type.self)] = { (compatible: ThemeCompatible, config: ThenThemeConfig) in
            guard let compatible = compatible as? Self,
                  let config = config as? T else {
                return
            }
            apply(compatible, config)
        }
    }
    
    fileprivate var themeHandler: Handler {
        if let handler = objc_getAssociatedObject(self, &key) as? Handler {
            return handler
        } else {
            let handler = Handler(host: self)
            handler.observe()
            objc_setAssociatedObject(self, &key, handler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return handler
        }
    }
}

/// MARK: - NSObject
@objc extension NSObject: ThemeCompatible {}


// MARK: - Associated Object

fileprivate var key = "theme_handler"
