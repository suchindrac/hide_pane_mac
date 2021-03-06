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
        
        if event.keyCode == 35 {
            NSLog("Setting current mouse location as hole coordinate")
            let mloc = NSEvent.mouseLocation
            let xloc = mloc.x
            let yloc = mloc.y
            
            theView.xloc = xloc
            theView.yloc = yloc
            
            self.view.display()
        }

        if event.keyCode == 15 {
            NSLog("Hiding your hole!")
            let mloc = NSEvent.mouseLocation
            theView.xloc = mloc.x
            theView.yloc = mloc.y
            theView.hide = true
            
            self.view.display()
        }

        
        if event.keyCode == 34 {
            NSLog("Increasing opacity")
            theView.alpha = theView.alpha + 0.05
            self.view.display()
        }

        if event.keyCode == 2 {
            NSLog("Decreasing opacity")
            theView.alpha = theView.alpha - 0.05
            self.view.display()
        }

        if event.keyCode == 126 {
            NSLog("Increasing Y coordinate")
            theView.yloc = theView.yloc + 10
            self.view.display()
        }
        if event.keyCode == 125 {
            NSLog("Decreasing Y coordinate")
            theView.yloc = theView.yloc - 10
            self.view.display()
        }
        if event.keyCode == 124 {
            NSLog("Increasing X coordinate")
            theView.xloc = theView.xloc + 10
            self.view.display()
        }
        if event.keyCode == 123 {
            NSLog("Decreasing X coordinate")
            theView.xloc = theView.xloc - 10
            self.view.display()
        }
        
        if event.keyCode == 3 {
            NSLog("Increasing the width")
            theView.width += 10
            self.view.display()
        }
        
        if event.keyCode == 17 {
            NSLog("Decreasing the width")
            theView.width -= 10
            self.view.display()
        }
        
        if event.keyCode == 11 {
            NSLog("Increasing the height")
            theView.height += 10
            self.view.display()
        }
        
        if event.keyCode == 1 {
            NSLog("Decreasing the height")
            theView.height -= 10
            self.view.display()
        }

        if event.keyCode == 45 {
            NSLog("Invert the colors of desktop")
            if theView.invert == false {
                theView.red = 0.0
                theView.blue = 0.0
                theView.green = 0.0
                theView.invert = true
            } else {
                theView.red = 1.0
                theView.blue = 1.0
                theView.green = 1.0
                theView.invert = false
            }
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

