//
//  AppDelegate.swift
//  PPFApplier
//
//  Created by Victor Maia Aldecoa on 05/03/17.
//  Copyright © 2017 victoraldecoa. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.isReleasedWhenClosed = false;
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        window.setIsVisible(true);
        return true;
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }

}

