//
//  Text_Pic.swift
//  iCheat_App
//
//  Created by Francesco on 11/10/15.
//  Copyright © 2015 Ro.V. Development. All rights reserved.
//

import UIKit
import WatchConnectivity

class Text_Pic: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, WCSessionDelegate {
    
    @IBOutlet weak var imagePicked: UIImageView!
    var session = WCSession!()
    @IBOutlet weak var tutorial: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var color: UIButton!
    
    var imageURL = NSURL!()
    var imageMetadata = [String : AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("image1") == nil) {
            
            tutorial.hidden = false
            
        } else {
            
            let imageData = NSUserDefaults.standardUserDefaults().objectForKey("image1") as! NSData
            let image: UIImage = UIImage(data: imageData)!
            
            tutorial.hidden = true
            imagePicked.image = image
        }
        
        if(WCSession .isSupported()) {
            
            self.session = WCSession.defaultSession()
            self.session.delegate = self
            self.session.activateSession()
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
            
        }
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imagePicked.image = image
        
        NSUserDefaults.standardUserDefaults().setObject(UIImageJPEGRepresentation(imagePicked.image!, 1.0), forKey: "image1")

        
        let imageUrl = editingInfo[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName = imageUrl.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as String!
        let photoURL = NSURL(fileURLWithPath: documentDirectory)
        let localPath = photoURL.URLByAppendingPathComponent(imageName!)
        let image = editingInfo[UIImagePickerControllerOriginalImage]as! UIImage
        let data = UIImagePNGRepresentation(image)
        
        data!.writeToFile(localPath.absoluteString, atomically: true)
        
        imageMetadata = ["url" : photoURL]
        imageURL = photoURL
        print(imageURL)
        
        NSUserDefaults.standardUserDefaults().setURL(imageURL, forKey: "image_URL")
        
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func upload(sender: AnyObject) {
   
        try! session.updateApplicationContext(["k" : imageURL])

    }
    
    @IBAction func hide(sender: UIButton) {
        
        tutorial.hidden = true
        
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
