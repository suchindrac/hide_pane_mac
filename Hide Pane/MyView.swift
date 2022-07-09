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
    
    var myRect = NSRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0)
    var fillDirty = true

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let myColor = NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: self.alpha)
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
    }
}
