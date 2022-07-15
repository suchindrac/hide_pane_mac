//
//  MyView.swift
//  Hide Pane
//
//  Created by Suchindra Chandrahas on 07/07/22.
//

import Cocoa

class MyView: NSView {

    var xloc = 0.0
    var yloc = 0.0
    var width = 400.0
    var height = 200.0
    var alpha = 0.8
    var red = 1.0
    var green = 1.0
    var blue = 1.0
    var invert = false
    var iinvert = false
    var hide = false
    
    var myRect = NSRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0)

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let myColor = NSColor(red: self.red, green: self.green, blue: self.blue, alpha: self.alpha)
        myColor.setFill()
        dirtyRect.fill()
            
        if dirtyRect.height < self.yloc {
            self.yloc = dirtyRect.height
        }
            
        if dirtyRect.width < self.xloc {
            self.xloc = dirtyRect.width
        }
            
        if self.xloc < 0 {
            self.xloc = 0
        }
            
        if self.yloc < 0 {
            self.yloc = 0
        }
        
        self.myRect = NSRect(x: self.xloc, y: self.yloc, width: self.width, height: self.height)
        self.myRect.fill(using: NSCompositingOperation.clear)
        
        if hide == true {
            self.myRect.fill(using: NSCompositingOperation.copy)
            hide = false
        }
    }
}
