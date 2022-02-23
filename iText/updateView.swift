//
//  updateView.swift
//  iText
//
//  Created by Francesco on 07/03/16.
//  Copyright © 2016 Ro.v.er Development. All rights reserved.
//

import UIKit

class updateView: UIViewController {
    
    @IBOutlet weak var circularProgressView: KDCircularProgress!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        circularProgressView.angle = 0
        self.increaseProgressButtonTapped()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func increaseProgressButtonTapped() {
        
        circularProgressView.animateToAngle(360, duration: 20.0) { completed in
            if completed {
                
                self.openApp()
            } else {
                // Animation was interrupted
            } 
        }
    }

    func openApp() {
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 480) {
            
            self.performSegueWithIdentifier("launchApp4s", sender: nil)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "update_request2")
        }
        
        if (height1 == 568) {
            
            self.performSegueWithIdentifier("launchApp5s", sender: nil)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "update_request2")
        }
        
        if (height1 == 667) {
            
            self.performSegueWithIdentifier("launchApp6", sender: nil)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "update_request2")
        }
        
        if (height1 == 736) {
            
            self.performSegueWithIdentifier("launchApp6s", sender: nil)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "update_request2")
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

}
