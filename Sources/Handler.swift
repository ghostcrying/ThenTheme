//
//  Handler.swift
//  ThenTheme
//
//  Created by 陈卓 on 2023/5/29.
//

import Foundation

/// Managed by ThemeCompatible to handle theme change notification
@objc
@objcMembers class Handler: NSObject {
    var observer: NSObjectProtocol!

    weak var host: ThemeCompatible?

    var mapping = [String: (ThemeCompatible, ThenThemeConfig) -> Void]()

    init(host: ThemeCompatible) {
        self.host = host
    }

    func observe() {
        observer = NotificationCenter.default.addObserver(
            forName: Notification.Name.themeDidChange,
            object: ThenTheme.shared,
            queue: OperationQueue.main,
            using: { [weak self] _ in
                self?.handle()
            }
        )
    }

    func handle() {
        guard let host = host else {
            return
        }
        guard let config = ThenTheme.shared.current else {
            return
        }
        guard let action = mapping[String(describing: type(of: config))] else {
            return
        }
        action(host, config)
    }

    deinit {
        if let activeObserver = observer {
            NotificationCenter.default.removeObserver(activeObserver)
        }
    }
}
