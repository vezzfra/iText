//
//  reportViewController.swift
//  iCheat_App
//
//  Created by Francesco on 06/03/16.
//  Copyright © 2016 Ro.V. Development. All rights reserved.
//

import UIKit
import Parse

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

class reportViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var iphone: UILabel!
    @IBOutlet weak var appVersion: UILabel!
    @IBOutlet weak var iOSVersion: UILabel!
    @IBOutlet weak var bugDescription: UITextView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var completeView: UIView!
    @IBOutlet weak var report: UIButton!
    
    var error1 = "Error"
    var message = "Please try again."

    override func viewDidLoad() {
        super.viewDidLoad()
        
        report.enabled = true
        self.completeView.hidden = true
        
        let systemVersion = UIDevice.currentDevice().systemVersion
        self.iOSVersion.text = "iOS" + " " + systemVersion
        
        let modelName = UIDevice.currentDevice().modelName
        self.iphone.text = modelName
        
        self.appVersion.text = "iText 1.2.4"
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        PFUser.logInWithUsernameInBackground("itext_user", password: "itext_user", block: {
            (user: PFUser?, error: NSError?) -> Void in
        
        })
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
        self.bugDescription.resignFirstResponder()
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("textBool")) {
            
            let bounds: CGRect = UIScreen.mainScreen().bounds
            let height1: CGFloat = bounds.size.height
            
            if (height1 == 480) {
                self.bugDescription.center = CGPointMake(self.bugDescription.center.x, self.bugDescription.center.y + 200)
            }
            
            if (height1 == 568) {
                self.bugDescription.center = CGPointMake(self.bugDescription.center.x, self.bugDescription.center.y + 200)
            }
            
            if (height1 == 667) {
                self.bugDescription.frame.size.height = bugDescription.frame.height + 100
            }
            
            if (height1 == 736) {
                self.bugDescription.frame.size.height = bugDescription.frame.height + 100
            }
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "textBool")
        } else { }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        if (height1 == 480) {
            self.bugDescription.center = CGPointMake(self.bugDescription.center.x, self.bugDescription.center.y - 200)
        }
        
        if (height1 == 568) {
            self.bugDescription.center = CGPointMake(self.bugDescription.center.x, self.bugDescription.center.y - 200)
        }
        
        if (height1 == 667) {
            self.bugDescription.frame.size.height = bugDescription.frame.height - 100
        }
        
        if (height1 == 736) {
            self.bugDescription.frame.size.height = bugDescription.frame.height - 100
        }

        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "textBool")
    }
    
    @IBAction func reportABug() {
        
        report.enabled = false
        let object: PFObject = PFObject(className: "bugReport")
        object["iPhoneModel"] = UIDevice.currentDevice().modelName
        object["iOSVersion"] = UIDevice.currentDevice().systemVersion
        object["appVersion"] = self.appVersion.text
        object["bugDescription"] = self.bugDescription.text
        
        object.saveInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError?) -> Void in
            
            if error == nil {
                
                self.bugDescription.text = ""
                self.completeView.hidden = false
            } else {
                
                let alertController = UIAlertController(title: self.error1 as String, message: self.message as String, preferredStyle: .Alert)
                let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                    
                }
                
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true, completion: nil)
                self.report.enabled = true
            }
        }
    }
    
    @IBAction func back(sender: UIButton) {
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "textBool")
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
