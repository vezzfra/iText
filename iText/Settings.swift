//
//  Settings.swift
//  iCheat_App
//
//  Created by Francesco on 09/10/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit
import WatchConnectivity

class Settings: UIViewController, WCSessionDelegate {
    
     var session = WCSession!()
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image1") == true) {
            
            image1.hidden = false
            
        } else { image1.hidden = true }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image2") == true) {
            
            image2.hidden = false
            
        } else { image2.hidden = true }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image3") == true) {
            
            image3.hidden = false
            
        } else { image3.hidden = true }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image4") == true) {
            
            image4.hidden = false
            
        } else { image4.hidden = true }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image5") == true) {
            
            image5.hidden = false
            
        } else { image5.hidden = true }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("image6") == true) {
            
            image6.hidden = false
            
        } else { image6.hidden = true }
        

        if(WCSession .isSupported()) {
            
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
            
        }
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 568) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(320, 665)
            
        }
        
        if (height1 == 667) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(375, 530)
            
        }
        
        if  (height1 == 480) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(320, 665)
            
        }
        
        if  (height1 == 736) {
            
            scroller.scrollEnabled = true
            scroller.contentSize = CGSizeMake(414, 599)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("firstFace", forKey: "Face_Selected")
        session.sendMessage(["h": "firstFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image6")
        
        image1.hidden = false
        image2.hidden = true
        image3.hidden = true
        image4.hidden = true
        image5.hidden = true
        image6.hidden = true
        
    }
    
    @IBAction func secondFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("secondFace", forKey: "Face_Selected")
        session.sendMessage(["i": "secondFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image6")
        
        image1.hidden = true
        image2.hidden = false
        image3.hidden = true
        image4.hidden = true
        image5.hidden = true
        image6.hidden = true
        
    }
    
    @IBAction func thirdFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("thirdFace", forKey: "Face_Selected")
        session.sendMessage(["l": "thirdFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image6")
        
        image1.hidden = true
        image2.hidden = true
        image3.hidden = false
        image4.hidden = true
        image5.hidden = true
        image6.hidden = true
        
    }
    
    @IBAction func fourthFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("fourthFace", forKey: "Face_Selected")
        session.sendMessage(["o": "fourthFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image6")
        
        image1.hidden = true
        image2.hidden = true
        image3.hidden = true
        image4.hidden = false
        image5.hidden = true
        image6.hidden = true
        
    }
    
    @IBAction func fifthFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("fifthFace", forKey: "Face_Selected")
        session.sendMessage(["p": "fifthFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image6")
        
        image1.hidden = true
        image2.hidden = true
        image3.hidden = true
        image4.hidden = true
        image5.hidden = false
        image6.hidden = true
        
    }
    
    @IBAction func sexthFace(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setObject("sexthFace", forKey: "Face_Selected")
        session.sendMessage(["q": "sexthFace"], replyHandler: nil, errorHandler: nil)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image1")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image2")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image3")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image4")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "image5")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image6")
        
        image1.hidden = true
        image2.hidden = true
        image3.hidden = true
        image4.hidden = true
        image5.hidden = true
        image6.hidden = false
        
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
