//
//  Faces.swift
//  iCheat_App
//
//  Created by Francesco on 09/10/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class Faces: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet weak var timer1: WKInterfaceDate!
    @IBOutlet weak var timer2: WKInterfaceGroup!
    @IBOutlet weak var timer3: WKInterfaceGroup!
    @IBOutlet weak var timer4: WKInterfaceGroup!
    @IBOutlet weak var timer5: WKInterfaceGroup!
    
    @IBOutlet weak var stocks: WKInterfaceGroup!
    @IBOutlet weak var calendar: WKInterfaceGroup!
    @IBOutlet weak var activity: WKInterfaceGroup!
    @IBOutlet weak var graph: WKInterfaceGroup!
    
    var session: WCSession!
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        
        if(NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") == nil) {
            
            timer1.setHidden(false)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(false)
            activity.setHidden(true)
            graph.setHidden(true)
            
        } else if (NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") as! String == "Faces_2") {
            
            timer1.setHidden(true)
            timer2.setHidden(false)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(false)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(true)
            
        } else if (NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") as! String == "Faces_3") {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(false)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(false)
            graph.setHidden(true)
            
        } else if (NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") as! String == "Faces_4") {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(false)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(true)
            
        } else if (NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") as! String == "Faces_5") {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(false)
            stocks.setHidden(true)
            calendar.setHidden(false)
            activity.setHidden(true)
            graph.setHidden(true)
            
        } else if (NSUserDefaults.standardUserDefaults().objectForKey("Faces_Selected") as! String == "Faces_6") {
            
            timer1.setHidden(true)
            timer2.setHidden(false)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(false)
            
        }
        
        if(WCSession .isSupported()) {
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
        }
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        
        if((message["h"]) != nil) {
           
            timer1.setHidden(false)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(false)
            activity.setHidden(true)
            graph.setHidden(true)
            
            NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "Faces_Selected")
            
        } else if ((message["i"]) != nil) {
            
            timer1.setHidden(true)
            timer2.setHidden(false)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(false)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(true)
            
            NSUserDefaults.standardUserDefaults().setObject("Faces_2", forKey: "Faces_Selected")
            
        } else if ((message["l"]) != nil) {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(false)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(false)
            graph.setHidden(true)
            
            NSUserDefaults.standardUserDefaults().setObject("Faces_3", forKey: "Faces_Selected")
            
        } else if ((message["o"]) != nil) {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(false)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(true)
            
            NSUserDefaults.standardUserDefaults().setObject("Faces_4", forKey: "Faces_Selected")
            
        } else if ((message["p"]) != nil) {
            
            timer1.setHidden(true)
            timer2.setHidden(true)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(false)
            stocks.setHidden(true)
            calendar.setHidden(false)
            activity.setHidden(true)
            graph.setHidden(true)
            
            NSUserDefaults.standardUserDefaults().setObject("Faces_5", forKey: "Faces_Selected")
            
        } else if ((message["q"]) != nil) {
            
            timer1.setHidden(true)
            timer2.setHidden(false)
            timer3.setHidden(true)
            timer4.setHidden(true)
            timer5.setHidden(true)
            stocks.setHidden(true)
            calendar.setHidden(true)
            activity.setHidden(true)
            graph.setHidden(false)
            
            NSUserDefaults.standardUserDefaults().setObject("Faces_6", forKey: "Faces_Selected")
            
        }
        
    }

}
