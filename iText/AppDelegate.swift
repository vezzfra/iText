//
//  AppDelegate.swift
//  iText
//
//  Created by Francesco on 07/03/16.
//  Copyright © 2016 Ro.v.er Development. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var integer = NSInteger()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if application.applicationState != UIApplicationState.Background {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
            
            let preBackgroundPush = !application.respondsToSelector(Selector("backgroundRefreshStatus"))
            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
            var pushPayload = false
            if let options = launchOptions {
                pushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil
            }
            if (preBackgroundPush || oldPushHandlerOnly || pushPayload) {
                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
            }
        }
        
        let types: UIUserNotificationType = [.Alert, .Badge, .Sound]
        let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        
        let bounds: CGRect = UIScreen.mainScreen().bounds
        let height1: CGFloat = bounds.size.height
        
        Parse.enableLocalDatastore()
        Parse.setApplicationId("MFBXDbeJrDh9vwLuXbmjJII0PWZEZy7mF8EzcXWj", clientKey: "2fjtFq5mPTaxbht5DYWjE1IAMYVXqe9fMFJlW8MU")
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        if (height1 == 480) {
            
            if (NSUserDefaults.standardUserDefaults().boolForKey("update_request2") == false) {
                
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("update_4s") as UIViewController
                self.window!.rootViewController = viewcontroller
            } else {
                
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("4s") as UIViewController
                self.window!.rootViewController = viewcontroller
            }
            
        }
        
        if (height1 == 568) {
            
            if (NSUserDefaults.standardUserDefaults().boolForKey("update_request2") == false) {
                
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("update_5s") as UIViewController
                self.window!.rootViewController = viewcontroller
            } else {
            
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("5s") as UIViewController
                self.window!.rootViewController = viewcontroller
            }
            
        }
        
        if (height1 == 667) {
            
            if (NSUserDefaults.standardUserDefaults().boolForKey("update_request2") == false) {
                
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("update_6") as UIViewController
                self.window!.rootViewController = viewcontroller
            } else {
            
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("6") as UIViewController
                self.window!.rootViewController = viewcontroller
            }
        }
        
        if (height1 == 736) {
            
            if (NSUserDefaults.standardUserDefaults().boolForKey("update_request2") == false) {
                
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("update_6s") as UIViewController
                self.window!.rootViewController = viewcontroller
            } else {
            
                var mainView: UIStoryboard!
                mainView = UIStoryboard(name: "Main", bundle: nil)
                let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("6p") as UIViewController
                self.window!.rootViewController = viewcontroller
            }
        }
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("opened2?") == false) {
            
            integer = 0
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "opened2?")
            
        } else {
            
            let string = NSUserDefaults.standardUserDefaults().integerForKey("launchNumber2") as NSInteger
            integer = string
            
        }
        
        
        integer = integer + 1
        NSUserDefaults.standardUserDefaults().setInteger(integer, forKey: "launchNumber2")
        
        if (integer == 1) {
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "image3")
            
        }
        
        if (integer == 2) {
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "show2")
            
        } else { }
        
        return true
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func plusPlusCounter(_: Int) {
        
        let key: NSString = "launchCount2"
        let integer1: NSInteger = 1 + NSUserDefaults.standardUserDefaults().integerForKey(key as String)
        NSUserDefaults.standardUserDefaults().setInteger(integer1, forKey: (key as String))
        
        return
    }
    
    func applicationWillTerminate(application: UIApplication) {
        
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        if error.code == 3010 {
            print("Push notifications are not supported in the iOS Simulator.")
        } else {
            print("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PFPush.handlePush(userInfo)
        if application.applicationState == UIApplicationState.Inactive {
            PFAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
        }
    }
    
    
}

