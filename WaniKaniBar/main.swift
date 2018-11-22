//
//  main.swift
//  WaniKaniBar
//
//  Created by Ben Griffith on 03/05/2018.
//  Copyright © 2018 Ben Griffith. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  let app: NSApplication
  let controller: WaniKaniBarController
  
  init(app: NSApplication) {
    print("init")
    self.app = app
    self.controller = WaniKaniBarController()
  }
  
  func applicationDidFinishLaunching(aNotification: NSNotification) {
    // Insert code here to initialize your application
    print("did finish loading")
  }
  
  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
    print("will terminate")
  }
}

let app = NSApplication.shared
let delegate = AppDelegate(app: app)
app.delegate = delegate
app.run()
