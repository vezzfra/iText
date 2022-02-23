//
//  Subjects.swift
//  iCheat
//
//  Created by Francesco on 11/07/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit
import WatchConnectivity

class Subjects: UIViewController, WCSessionDelegate {

    @IBOutlet weak var sub1: UIButton!
    @IBOutlet weak var sub2: UIButton!
    @IBOutlet weak var sub3: UIButton!
    @IBOutlet weak var sub4: UIButton!
    @IBOutlet weak var sub5: UIButton!
    @IBOutlet weak var title1: UITextField!
    @IBOutlet weak var title2: UITextField!
    @IBOutlet weak var title3: UITextField!
    @IBOutlet weak var title4: UITextField!
    @IBOutlet weak var title5: UITextField!
    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var end: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var view1: UIView!
    
    var session = WCSession!()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        end.hidden = true
        title1.enabled = false
        title2.enabled = false
        title3.enabled = false
        title4.enabled = false
        title5.enabled = false
        
        if(WCSession .isSupported()) {
            
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
            
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("title1") == nil) {
            
        } else {
            
            title1.text = NSUserDefaults.standardUserDefaults().objectForKey("title1") as? String
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("title2") == nil) {
            
        } else {
            
            title2.text = NSUserDefaults.standardUserDefaults().objectForKey("title2") as? String
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("title3") == nil) {
            
        } else {
            
            title3.text = NSUserDefaults.standardUserDefaults().objectForKey("title3") as? String
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("title4") == nil) {
            
        } else {
            
            title4.text = NSUserDefaults.standardUserDefaults().objectForKey("title4") as? String
        }
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("title5") == nil) {
            
        } else {
            
            title5.text = NSUserDefaults.standardUserDefaults().objectForKey("title5") as? String
        }

        
        view1.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func edit(sender: UIButton) {
        
        end.hidden = false
        edit.hidden = true
    
        title1.enabled = true
        title2.enabled = true
        title3.enabled = true
        title4.enabled = true
        title5.enabled = true
        sub1.enabled = false
        sub2.enabled = false
        sub3.enabled = false
        sub4.enabled = false
        sub5.enabled = false
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 568) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(320, 580)
            
        }
        
        if (height1 == 667) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(319, 627)
            
        }
        
        if  (height1 == 480) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(320, 550)
            
        }
        
        if  (height1 == 736) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(326, 500)
            
        }
        
        
    }
    
    @IBAction func checked(sender: UIButton) {
        
        end.hidden = true
        edit.hidden = false
        view1.hidden = true
        title1.enabled = false
        title2.enabled = false
        title3.enabled = false
        title4.enabled = false
        title5.enabled = false
        sub1.enabled = true
        sub2.enabled = true
        sub3.enabled = true
        sub4.enabled = true
        sub5.enabled = true
        scroller.scrollEnabled = false
        let point = CGPointMake(0, 0)
        scroller.setContentOffset(point, animated: true)
        
        NSUserDefaults.standardUserDefaults().setObject(title1.text, forKey: "title1")
        NSUserDefaults.standardUserDefaults().setObject(title2.text, forKey: "title2")
        NSUserDefaults.standardUserDefaults().setObject(title3.text, forKey: "title3")
        NSUserDefaults.standardUserDefaults().setObject(title4.text, forKey: "title4")
        NSUserDefaults.standardUserDefaults().setObject(title5.text, forKey: "title5")
        
        if (title1.text == "") {
            
            session.sendMessage(["x": "Note 1"], replyHandler: nil, errorHandler: nil)
        } else {
            
            session.sendMessage(["x": title1.text!], replyHandler: nil, errorHandler: nil)
        }
        
        if (title2.text == "") {
            
            session.sendMessage(["z": "Note 2"], replyHandler: nil, errorHandler: nil)
        } else {
            
            session.sendMessage(["z": title2.text!], replyHandler: nil, errorHandler: nil)
        }
        
        if (title3.text == "") {
            
            session.sendMessage(["c": "Note 3"], replyHandler: nil, errorHandler: nil)
        } else {
            
            session.sendMessage(["c": title3.text!], replyHandler: nil, errorHandler: nil)
        }
        
        if (title4.text == "") {
            
            session.sendMessage(["v": "Note 4"], replyHandler: nil, errorHandler: nil)
        } else {
            
            session.sendMessage(["v": title4.text!], replyHandler: nil, errorHandler: nil)
        }
        
        if (title5.text == "") {
            
            session.sendMessage(["o": "Note 5"], replyHandler: nil, errorHandler: nil)
        } else {
            
            session.sendMessage(["o": title5.text!], replyHandler: nil, errorHandler: nil)
        }
    }
        
    @IBAction func end(sender: UIButton) {
        
        view1.hidden = false
        
        title1.enabled = false
        title2.enabled = false
        title3.enabled = false
        title4.enabled = false
        title5.enabled = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
