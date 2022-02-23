//
//  Text2.swift
//  iCheat_App
//
//  Created by Francesco on 27/09/15.
//  Copyright (c) 2015 Ro.V. Development. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class Text2: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet weak var text: WKInterfaceLabel!
    @IBOutlet weak var alertGroup: WKInterfaceGroup!
    var session: WCSession!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        alertGroup.setHidden(false)
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("Text2_Text") == nil) {
            
            text.setText("Add a text on your iPhone's App")
            
        } else {
            
            let string1 = NSUserDefaults.standardUserDefaults().objectForKey("Text2_Text") as! String
            text.setText(string1)
            
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if(WCSession .isSupported()) {
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
        }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        
        self.text.setText(message["m1"]! as? String)
        
        NSUserDefaults.standardUserDefaults().setObject(message["m1"], forKey: "Text2_Text")
        
    }
    
    @IBAction func sync(sender: WKInterfaceButton) {
        
        let action1 = WKAlertAction(title: "OK", style: .Default) {
            
            if (!(NSUserDefaults.standardUserDefaults().objectForKey("Text2_Text") == nil)) {
                self.session.sendMessage(["m8":NSUserDefaults.standardUserDefaults().objectForKey("Text2_Text") as! String], replyHandler: {replyMessage in
                    }, errorHandler: {(error ) -> Void in
                        print("no reply message from phone")
                })
            }
            
        }
        let action2 = WKAlertAction(title: "No", style: .Cancel) {}
        
        presentAlertControllerWithTitle("", message: "Are you sure you want to send this text to iPhone?", preferredStyle: .ActionSheet, actions: [action1, action2])
        
        
    }
    
}
