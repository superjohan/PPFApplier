//
//  MainMenuController.swift
//  PPFApplier
//
//  Created by Victor Maia Aldecoa on 05/03/17.
//  Copyright © 2017 victoraldecoa. All rights reserved.
//

import Cocoa

class MainMenuController: NSWindowController {
    
    @IBOutlet weak var textFieldIso: NSTextField!
    @IBOutlet weak var textFieldPpf: NSTextField!
    
    override func awakeFromNib() {
        super.windowDidLoad()
    }
    
    @IBAction func findIso(_ sender: NSButton) {
        let panel = createPanel();
        panel.begin { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                self.textFieldIso.stringValue = panel.urls.first?.path ?? "";
            }
        }
    }
    
    @IBAction func findPpf(_ sender: NSButton) {
        let panel = createPanel();
        panel.begin { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                self.textFieldPpf.stringValue = panel.urls.first?.path ?? "";
            }
        }
    }
    @IBAction func apply(_ sender: NSButton) {
        let result = self.textFieldIso.stringValue.withCString { isoPath in
            self.textFieldPpf.stringValue.withCString { ppfPath in
                ApplyPatch(
                    UnsafeMutablePointer(mutating: isoPath),
                    UnsafeMutablePointer(mutating: ppfPath)
                )
            }
        }
        
        let alert = NSAlert();
        alert.addButton(withTitle: "OK");
        alert.messageText = result == 0 ? "PPF applied successfully!" : "An error ocurred";
        alert.runModal();
        
        resetView();
    }
    
    func resetView() {
        self.textFieldIso.stringValue = "";
        self.textFieldPpf.stringValue = "";
    }
    
    func createPanel() -> NSOpenPanel {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        return openPanel;
    }
}
