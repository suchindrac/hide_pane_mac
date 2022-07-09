//
//  ViewController.swift
//  Hide Pane
//
//  Created by Suchindra Chandrahas on 07/07/22.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.window?.backgroundColor = NSColor.white
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.keyDown(with: $0)
            return $0
        }
    }
    
    override func keyDown(with event: NSEvent) {
        NSLog(String(event.keyCode))
        
        let theView = self.view as! MyView
        
        if event.keyCode == 34 {
            NSLog("Increasing opacity")
            theView.fillDirty = true
            theView.alpha = theView.alpha + 0.1
            self.view.display()
        }

        if event.keyCode == 2 {
            NSLog("Decreasing opacity")
            theView.fillDirty = true
            theView.alpha = theView.alpha - 0.1
            self.view.display()
        }

        if event.keyCode == 126 {
            NSLog("Increasing Y coordinate")
            theView.yloc = theView.yloc + 10
            theView.fillDirty = false
            self.view.display()
        }
        if event.keyCode == 125 {
            NSLog("Decreasing Y coordinate")
            theView.yloc = theView.yloc - 10
            theView.fillDirty = false
            self.view.display()
        }
        if event.keyCode == 124 {
            NSLog("Increasing X coordinate")
            theView.xloc = theView.xloc + 10
            theView.fillDirty = false
            self.view.display()
        }
        if event.keyCode == 123 {
            NSLog("Decreasing X coordinate")
            theView.xloc = theView.xloc - 10
            theView.fillDirty = false
            self.view.display()
        }

    }
    
    override func viewWillDisappear() {
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
   
    @IBOutlet weak var debug: NSTextField!
}

