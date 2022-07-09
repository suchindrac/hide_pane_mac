//
//  AppDelegate.swift
//  Hide Pane
//
//  Created by Suchindra Chandrahas on 07/07/22.
//

import Cocoa


@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var item: NSStatusItem? = nil


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let window = NSApplication.shared.windows.first
        window?.isOpaque = false
        window?.backgroundColor = .clear
        window?.level = NSWindow.Level.popUpMenu
        
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let itemImage = NSImage(named: "hide_pane")
        itemImage?.size = NSMakeSize(18.0, 18.0)

        itemImage?.isTemplate = true

        self.item?.button?.image = itemImage
        self.item?.button?.action = #selector(AppDelegate.mainAction)

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Focus on pane", action: #selector(AppDelegate.focusOnPane), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Exit", action: #selector(AppDelegate.exit), keyEquivalent: ""))

        item?.menu = menu
        
        window?.ignoresMouseEvents = true
        // window?.backgroundColor = NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        window?.backgroundColor = NSColor.clear
        window?.isOpaque = false
        
        
        window?.toggleFullScreen(self)
        
        window?.collectionBehavior = NSWindow.CollectionBehavior.fullScreenPrimary
        let screenFrame = NSScreen.main?.frame
        
        window?.setFrame(screenFrame!, display: true)
        
        let myView = MyView()
        window?.contentView = myView
        
    }
    
    @objc func mainAction() {
        NSLog("Inside hide pane")
    }

    @objc func focusOnPane() {
        let window = NSApplication.shared.windows.first
        window?.makeKeyAndOrderFront(self)
    }
    @objc func exit() {
        NSApplication.shared.terminate(self)

    }
}

