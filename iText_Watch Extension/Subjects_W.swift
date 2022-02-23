//
//  Subjects_W.swift
//  iCheat
//
//  Created by Francesco on 26/09/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class Subjects_W: WKInterfaceController, WCSessionDelegate {
    
    var session: WCSession!
    
    @IBOutlet weak var sub1: WKInterfaceButton!
    @IBOutlet weak var sub2: WKInterfaceButton!
    @IBOutlet weak var sub3: WKInterfaceButton!
    @IBOutlet weak var sub4: WKInterfaceButton!
    @IBOutlet weak var sub5: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        if (NSUserDefaults.standardUserDefaults().objectForKey("x") == nil) {
            
        } else {
            
            sub1.setTitle(NSUserDefaults.standardUserDefaults().objectForKey("x") as? String)
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("z") == nil) {
            
        } else {
            
            sub2.setTitle(NSUserDefaults.standardUserDefaults().objectForKey("z") as? String)
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("c") == nil) {
            
        } else {
            
            sub3.setTitle(NSUserDefaults.standardUserDefaults().objectForKey("c") as? String)
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("v") == nil) {
            
        } else {
            
            sub4.setTitle(NSUserDefaults.standardUserDefaults().objectForKey("v") as? String)
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("o") == nil) {
            
        } else {
            
            sub5.setTitle(NSUserDefaults.standardUserDefaults().objectForKey("o") as? String)
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

    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        
        if (message["x"] != nil) {
            
            self.sub1.setTitle(message["x"]! as? String)
            NSUserDefaults.standardUserDefaults().setObject(message["x"], forKey: "x")
        }
        
        if (message["z"] != nil) {
            
            self.sub2.setTitle(message["z"]! as? String)
            NSUserDefaults.standardUserDefaults().setObject(message["z"], forKey: "z")
        }
        
        if (message["c"] != nil) {
            
            self.sub3.setTitle(message["c"]! as? String)
            NSUserDefaults.standardUserDefaults().setObject(message["c"], forKey: "c")
        }
        
        if (message["v"] != nil) {
            
            self.sub4.setTitle(message["v"]! as? String)
            NSUserDefaults.standardUserDefaults().setObject(message["v"], forKey: "v")
        }
        
        if (message["o"] != nil) {
            
            self.sub5.setTitle(message["o"]! as? String)
            NSUserDefaults.standardUserDefaults().setObject(message["o"], forKey: "o")
        }
        
        print(message["x"])
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


}
