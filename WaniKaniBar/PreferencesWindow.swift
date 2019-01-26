//
//  PreferencesWindow.swift
//  WaniKaniBar
//
//  Created by Ben Griffith on 04/05/2018.
//  Copyright © 2018 Ben Griffith. All rights reserved.
//

import Cocoa

protocol PreferencesWindowDelegate {
  func preferencesDidUpdate()
}

class PreferencesWindow: NSWindowController, NSWindowDelegate {
    public static let PrefKeyNotifications: String! = "showNotifications"
    public static let PrefKeyShowTime: String! = "showTime"
    public static let PrefKeyApiKey: String! = "ApiKey"

  @IBOutlet weak var userApiKeyTextField: NSTextField!
  @IBOutlet weak var showNotificationButton: NSButton!
  @IBOutlet weak var showTimeButton: NSButton!
  @IBOutlet weak var autoStartButton: NSButton!
  
  var delegate: PreferencesWindowDelegate?
  
  override var windowNibName : NSNib.Name? {
    return NSNib.Name(rawValue: "PreferencesWindow")
  }
  
  override func windowDidLoad() {
    super.windowDidLoad()

    let defaults = UserDefaults.standard
    if let val = defaults.string(forKey: PreferencesWindow.PrefKeyApiKey) {
        userApiKeyTextField.stringValue = val
    }

    if defaults.bool(forKey: PreferencesWindow.PrefKeyNotifications) {
        showNotificationButton.state = .on
    } else {
        showNotificationButton.state = .off
    }

    if defaults.bool(forKey: PreferencesWindow.PrefKeyShowTime) {
        showTimeButton.state = .on
    } else {
        showTimeButton.state = .off
    }
    
    self.window?.center()
    self.window?.makeKeyAndOrderFront(nil)
  }
  
  func setWindowVisible(){
    NSApp.activate(ignoringOtherApps: true)
  }
  
  func windowWillClose(_ notification: Notification) {
    let defaults = UserDefaults.standard

    defaults.setValue(userApiKeyTextField.stringValue, forKey: PreferencesWindow.PrefKeyApiKey)
    defaults.setValue(showNotificationButton.state == .on, forKey: PreferencesWindow.PrefKeyNotifications)
    defaults.setValue(showTimeButton.state == .on, forKey: PreferencesWindow.PrefKeyShowTime)
    
    delegate?.preferencesDidUpdate()
  }
}
