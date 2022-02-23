//
//  ViewController1.swift
//  iCheat_App
//
//  Created by Francesco on 28/09/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController1: UIViewController {
    
    @IBOutlet var view1: UIView!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var reviewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("show2") == false) {
            
            reviewView.hidden = true
            
        } else {
            if (NSUserDefaults.standardUserDefaults().boolForKey("showed2") == false) {
            
            reviewView.hidden = false
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "showed2")
                
            } else { reviewView.hidden = true }
            
        }
        
        if(NSUserDefaults.standardUserDefaults().boolForKey("first_open1") == false) {
            
            view1.hidden = false
            
        } else {
            
            view1.hidden = true
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("avviso2_text") == nil) {
            
            let alertController = UIAlertController(title: NSString(format:  NSLocalizedString("Attention!", comment: "title comment")) as String, message: NSString(format: NSLocalizedString("We have tried to correct all the bugs present in our app iText, but we were not able to reproduce some of them. If, after trying to reinstall the app, you are still encountering some errors please use the new section \"Report a bug\" in the settings to let us know how to reproduce them. Thank you for your patience and sorry for eventual inconvenience with our product.", comment: "message comment")) as String, preferredStyle: .Alert)
            let cancelAction : UIAlertAction = UIAlertAction(title: "Okay", style: .Cancel) { (action) -> Void in
                NSUserDefaults.standardUserDefaults().setObject("done", forKey: "avviso2_text")
            }
            
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else { }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    @IBAction func hideViewReview(sender: UIButton) {
        
        reviewView.hidden = true
        
    }
    
    
    @IBAction func hideView(sender: UIButton) {
        
        view1.hidden = true
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "first_open1")
        
    }
    
}
