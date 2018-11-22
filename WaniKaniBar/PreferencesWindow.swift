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
  @IBOutlet weak var userApiKeyTextField: NSTextField!
  
  var delegate: PreferencesWindowDelegate?
  
  override var windowNibName : NSNib.Name? {
    return NSNib.Name("PreferencesWindow")
  }
  
  override func windowDidLoad() {
    super.windowDidLoad()
    
    self.window?.center()
    self.window?.makeKeyAndOrderFront(nil)
  }
  
  func setWindowVisible(){
    NSApp.activate(ignoringOtherApps: true)
  }
  
  func windowWillClose(_ notification: Notification) {
    let defaults = UserDefaults.standard
    defaults.setValue(userApiKeyTextField.stringValue, forKey: "ApiKey")
    
    delegate?.preferencesDidUpdate()
  }
}
