//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-09.
//

import Foundation

#if os(OSX)
import AppKit

public extension UserInterface {
    static func show<V>(view: V) where V: NSView {
        let app = createApp(view: view) { app_ in
            print("window closed")
            app_.terminate(nil)
        }
        app.run()
    }
}

private func createApp(
    view: NSView,
    _ windowClosedHandler: @escaping (NSApplication) -> Void
) -> NSApplication {
    let app = createApp()
    
    window(contentView: view) {
        windowClosedHandler(app)
    }
    
    app.finishLaunching()
    
    return app
}

private func window(
    contentView: NSView,
    _ windowClosedHandler: @escaping () -> Void
) {
    
    let size = NSScreen.main!.frame.size.height / 2
    
    let window = NSWindow(
        contentRect: NSRect(x: 50, y: 50, width: size, height: size),
        styleMask: [.closable, .titled, .resizable, .miniaturizable],
        backing: .buffered,
        defer: true
    )
    
    let windowDelegate = WindowDelegate { windowWillCloseNotification in
        let _ = windowWillCloseNotification
        windowClosedHandler()
    }
    window.delegate = windowDelegate
    window.acceptsMouseMovedEvents = true
    window.orderFrontRegardless()
    window.contentView = contentView
}

private func createApp() -> NSApplication {
    let app = NSApplication.shared
    let appDelegate = AppDelegate()
    app.delegate = appDelegate
    app.setActivationPolicy(.regular)
    return app
}

private class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("📺 should have presented window")
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        print("📺 applicationWillTerminate")
    }
}

typealias WindowWillCloseListener = (Notification) -> Void
private class WindowDelegate: NSObject, NSWindowDelegate {
    private let windowWillCloseListener: WindowWillCloseListener
    init(windowWillCloseListener: @escaping WindowWillCloseListener) {
        self.windowWillCloseListener = windowWillCloseListener
    }
    
    func windowDidResize(_ notification: Notification) {}
    
    func windowWillClose(_ notification: Notification) {
        windowWillCloseListener(notification)
    }
}


#endif
