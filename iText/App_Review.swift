//
//  App_Review.swift
//  iCheat_App
//
//  Created by Francesco on 13/10/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit

class App_Review: UIViewController {
    
    @IBOutlet weak var review: UIButton!
    @IBOutlet weak var notNow: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func review(sender: UIButton) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/IT/app/id1047662228?mt=8")!)
        
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
