//
//  Text1.swift
//  iCheat_App
//
//  Created by Francesco on 27/09/15.
//  Copyright (c) 2015 Ro.V. Development. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class Text1: WKInterfaceController, WCSessionDelegate {
    
    var session: WCSession!
    @IBOutlet weak var text: WKInterfaceLabel!
    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var alertGroup: WKInterfaceGroup!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        alertGroup.setHidden(false)
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("dataReceived1") == nil) {
            
            print("already nil")
            
        } else {
            
            let imageData = NSUserDefaults.standardUserDefaults().objectForKey("dataReceived1") as! NSData
            self.image.setImageData(imageData)
            
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("Text1_Text") == nil) {
            
            text.setText("Add a text on your iPhone's App")
            
        } else {
            
            let string1 = NSUserDefaults.standardUserDefaults().objectForKey("Text1_Text") as! String
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
        
        if (message["m"] != nil) {
        
        self.text.setText(message["m"]! as? String)
        
        NSUserDefaults.standardUserDefaults().setObject(message["m"], forKey: "Text1_Text")
            
            print("text")
        
        }
        
        
        if (message["s"] != nil) {
            
            imageSender()
            NSUserDefaults.standardUserDefaults().setObject(message["s"], forKey: "dataReceived1")
            
            print("message Received")
            
        }
    }
    
    func session(session: WCSession, didReceiveMessageData messageData: NSData) {
        
        imageSender()
        NSUserDefaults.standardUserDefaults().setObject(messageData, forKey: "dataReceived1")
        
        print("message Received")
        
    }

    func session(session: WCSession, didReceiveFile file: WCSessionFile) {
        
        let imageURL = file.fileURL
        let data = NSData(contentsOfURL: imageURL)
        
        image.setImageData(data)
        print("message Received")
    }

    
    func imageSender() {
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("dataReceived") == nil) {
            
            print("no object")
            
        } else {
          
            let imageData = NSUserDefaults.standardUserDefaults().objectForKey("dataReceived1") as! NSData
            self.image.setImageNamed("4th_Rover copia.png")
            
        }
        

        
    }
    


    @IBAction func sync(sender: WKInterfaceButton) {
        
        let action1 = WKAlertAction(title: "OK", style: .Default) {
            
            if (!(NSUserDefaults.standardUserDefaults().objectForKey("Text1_Text") == nil)) {
                self.session.sendMessage(["m9":NSUserDefaults.standardUserDefaults().objectForKey("Text1_Text") as! String], replyHandler: {replyMessage in
                    }, errorHandler: {(error ) -> Void in
                        print("no reply message from phone")
                })
            }
            
        }
        let action2 = WKAlertAction(title: "No", style: .Cancel) {}
        
        presentAlertControllerWithTitle("", message: "Are you sure you want to send this text to iPhone?", preferredStyle: .ActionSheet, actions: [action1, action2])
        
        
    }
    
}
