////
////  AppDelegate.swift
////  AutoClicker
////
////  Created by Espen Wiborg on 2016-04-19.
////  Copyright © 2016 Espen Wiborg. All rights reserved.
////
//
//import MASShortcut
//
//@NSApplicationMain
//class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
//
//    @IBOutlet weak var preferencesWindow: NSWindow!
//    @IBOutlet weak var statusMenu: NSMenu!
//    @IBOutlet weak var shortcutView: MASShortcutView!
//
//    @IBOutlet weak var speedLabel: NSTextField!
//    @IBOutlet weak var speedSlider: NSSlider!
//
//    var prefsActive: Bool = false
//
//    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//    let shortcutKey = "GlobalShortcut"
//    let intervalKey = "Interval"
//    
//    let defaults = UserDefaults.standard
//
//    @IBAction func speedChanged(sender: NSSlider) {
//        let clicksPerSecond = sender.integerValue
//        speedLabel.stringValue = "\(clicksPerSecond) clicks/s"
//        defaults.set(1000 / clicksPerSecond, forKey: intervalKey)
//    }
//
//    @IBAction func quitClicked(sender: NSMenuItem) {
//        NSApplication.shared.terminate(self)
//    }
//
//    @IBAction func preferencesClicked(sender: NSMenuItem) {
//        preferencesWindow.makeKeyAndOrderFront(self)
//        NSApp.activate(ignoringOtherApps: true)
//        prefsActive = true
//    }
//
//    private func windowWillClose(notification: NSNotification) {
//        prefsActive = false
//    }
//
//    func callback() {
//        let skip = prefsActive && preferencesWindow.frame.contains(NSEvent.mouseLocation)
//
//        if !skip {
//            toggleClicking()
//        }
//    }
//
//    var timer: Timer? = nil
//
//    func toggleClicking() {
//        if timer == nil {
//            let interval = defaults.double(forKey: intervalKey)
//            timer = Timer.scheduledTimer(timeInterval: interval / 1000, target: self, selector: Selector(("click")), userInfo: nil, repeats: true)
//        } else {
//            timer?.invalidate()
//            timer = nil
//        }
//    }
//
//    func click() {
//        let dummy = CGEvent(source: nil)
//        let loc = dummy!.location
//
////        let mouseDown = CGEvent(mouseEventSource: nil, mouseType: CGEventType.LeftMouseDown, mouseCursorPosition: loc, mouseButton: leftMouseDownCGMouseButton.left)
////        let mouseUp = CGEvent(mouseEventSource: nil, mouseType: CGEventType.LeftMouseUp, mouseCursorPosition: loc, mouseButton: leftMouseUpCGMouseButton.left)
////        CGEventPost(CGEventTapLocation.CGHIDEventTap, mouseDown)
////        mouseUp.post(tap: CGEventTapLocation.CGHIDEventTapcghidEventTapmouseUp.posttap: cghidEventTap)
//    }
//
//    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        statusItem.title = "AutoClicker"
//        statusItem.menu = statusMenu
//        shortcutView.associatedUserDefaultsKey = shortcutKey
//
//        defaults.register(defaults: [ intervalKey: 1000 ])
//
//        let clicksPerSecond = 1000 / defaults.integer(forKey: intervalKey)
//
//        speedSlider.integerValue = max(clicksPerSecond, Int(speedSlider.minValue))
//        speedChanged(sender: speedSlider)
//
//        preferencesWindow.delegate = self
////        preferencesWindow.level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey))NSWindow.Level(rawValue: ) ?? <#default value#>
////
//        MASShortcutBinder.shared().bindShortcut(withDefaultsKey: shortcutKey, toAction: callback)
//    }
//
//    func applicationWillTerminate(aNotification: NSNotification) {
//        MASShortcutMonitor.shared().unregisterAllShortcuts()
//    }
//}
//
