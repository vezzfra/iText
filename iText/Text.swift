//
//  Text.swift
//  iCheat
//
//  Created by Francesco on 27/09/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit
import WatchConnectivity


class Text: UIViewController, WCSessionDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cheatText: UITextView!
    @IBOutlet weak var add: UIButton!
    
    var session = WCSession!()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        add.hidden = true
 
        if (NSUserDefaults.standardUserDefaults().objectForKey("Test1_Text") == nil) {
            
            cheatText.text = "Write here the text which you would see on the Apple Watch!"
            
        } else {
            
            let string2 = NSUserDefaults.standardUserDefaults().objectForKey("Test1_Text") as! String
            cheatText.text = string2
            
        }
        
        if(WCSession .isSupported()) {
            
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
            
        }
        
    }

    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 568) {
            
            textView.bounds.size.height = 200
            textView.center.y = 248
            
        }
        
        if (height1 == 667) {
            
            textView.bounds.size.height = 320
            textView.center.y = 280
            
        }
        
        if (height1 == 480) {
            
            textView.bounds.size.height = 160
            textView.center.y = 179
            
        }
        
        if (height1 == 736) {
            
            textView.bounds.size.height = 334
            textView.center.y = 339
            
        }
        
       return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 568) {
            
            cheatText.center.y = 317
            cheatText.bounds.size.height = 338
            
        }
        
        if (height1 == 667) {
        
            cheatText.center.y = 357
            cheatText.bounds.size.height = 472
            
        }
        
        if (height1 == 480) {
            
            cheatText.center.y = 255
            cheatText.bounds.size.height = 312
            
        }
        
        if (height1 == 736) {
            
            cheatText.center.y = 383
            cheatText.bounds.size.height = 422

        }
        
        cheatText.resignFirstResponder()
    }
    
    @IBAction func back(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject(cheatText.text, forKey: "Test1_Text")
        
    }
    
    @IBAction func update(sender: UIButton) {
            
            NSUserDefaults.standardUserDefaults().setObject(cheatText.text, forKey: "Test1_Text")
            session.sendMessage(["m": cheatText.text], replyHandler: nil, errorHandler: nil)
        
    }

    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n") {
            textView.resignFirstResponder()

            let bounds: CGRect = UIScreen.mainScreen().bounds
            let height1: CGFloat = bounds.size.height
            
            if (height1 == 568) {
                
                cheatText.center.y = 317
                cheatText.bounds.size.height = 338
                
            }
            
            if (height1 == 667) {
                
                cheatText.center.y = 357
                cheatText.bounds.size.height = 472
                
            }
            
            if (height1 == 480) {
                
                cheatText.center.y = 255
                cheatText.bounds.size.height = 312
                
            }
            
            if (height1 == 736) {
                
                cheatText.center.y = 383
                cheatText.bounds.size.height = 422
                
            }
            
            return false
        }
    
        return true
    }
    

    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: [String : AnyObject] -> Void) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.cheatText.text = message["m9"] as! String
        }
    }
    
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


