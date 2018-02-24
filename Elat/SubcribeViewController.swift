//
//  SubcribeViewController.swift
//  Elat
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SubcribeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstnameField: UITextField!
   
    @IBOutlet weak var lastnameField: UITextField!
   
    @IBOutlet weak var birthdayField: UITextField!
   
    @IBOutlet weak var phoneField: UITextField!
   
    @IBOutlet weak var emailField: UITextField!
   
    @IBOutlet weak var carnumberField: UITextField!
   
    @IBOutlet weak var kilometersField: UITextField!
   
    @IBOutlet weak var passwordField: UITextField!
  
    @IBOutlet weak var myimageview: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // hide navigation bar
        self.navigationController?.navigationBarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
   
    //press "select photo" button
    @IBAction func OnSelectButtonClick(sender: AnyObject) {
        let myPickerController = UIImagePickerController()
   
        myPickerController.delegate = self
        
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        myimageview.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //back button click
    @IBAction func OnBackBtnClick(sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func OnSubcribeButtonClick(sender: AnyObject) {
        let firstname = firstnameField.text;
        let lastname = lastnameField.text;
        let birthday = birthdayField.text;
        let phone = phoneField.text;
        let email = emailField.text;
        let carnumber = carnumberField.text;
        let kilometers = kilometersField.text;
        let password = passwordField.text;
        let image = myimageview.image;
        
        //  check all fields
        
        if(firstname == "" || lastname == "" || birthday == "" || phone == "" || email == "" || carnumber == "" || kilometers == "" || password == "")
        {
            //display alert message
            let checkfailed = UIAlertController(title: "Input Error", message: "All fields are required!", preferredStyle: UIAlertControllerStyle.Alert)
            
            checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(checkfailed, animated: true, completion: nil)
            return;
        }
        
        
        // check existing of car number and user with this car number
        
        let query = PFQuery(className: "ELATCustomer")
        
        query.whereKey("carnumber", equalTo: carnumber!)
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if objects!.count>0 {
                    
        //  check existing of user with carnumber
                    let subquery = PFQuery(className: "_User")
                    subquery.whereKey("carnumber", equalTo: carnumber!)
                    subquery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
                        if error == nil {
                            if objects!.count>0 {
                                let checkfailed = UIAlertController(title: "Subcribe Error", message: "You have already registed in ELAT", preferredStyle: UIAlertControllerStyle.Alert)
                                checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                self.presentViewController(checkfailed, animated: true, completion: nil)
                                return;
                            }
                            else{
                                let newUser = PFUser()
                                
                                newUser.username = email
                                newUser.password = password
                                newUser.email = email
                                newUser["firstname"] = firstname
                                newUser["lastname"] = lastname
                                newUser["birthday"] = birthday
                                newUser["phone"] = phone
                                newUser["carnumber"] = carnumber
                                newUser["kilometers"] = kilometers
                                
                                if image != nil{
                                   let imagename = firstname!+"_"+lastname!+".jpg"
                                    //
                                    // create image data
                                    let imagedata = UIImageJPEGRepresentation(image!,0.7)
                                    //
                                    //  create parse file to share in cloud
                                    let parseimagefile = PFFile(name: imagename, data: imagedata!)!
                                    newUser["photo"] = parseimagefile
                                }
                                
                                newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                                    
//                                    // Stop the spinner
//                                    spinner.stopAnimating()
                                    if ((error) != nil) {
                                        let checkfailed = UIAlertController(title: "Subcribes are failed!", message: "\(error)", preferredStyle: UIAlertControllerStyle.Alert)
                                        checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                        
                                        self.presentViewController(checkfailed, animated: true, completion: nil)
                                                                                return;

                                        
                                    } else {
                                        if let navController = self.navigationController {
                                           navController.popViewControllerAnimated(true)
                                        }
                                    }
                                })
//                                let userdata = PFObject(className: "User")
//                                
//                                userdata.setObject(firstname!, forKey: "firstname")
//                                userdata.setObject(lastname!, forKey: "lastname")
//                                userdata.setObject(birthday!, forKey: "birthday")
//                                userdata.setObject(phone!, forKey: "phone")
//                                userdata.setObject(email!, forKey: "email")
//                                userdata.setObject(carnumber!, forKey: "carnumber")
//                                userdata.setObject(kilometers!, forKey: "kilometers")
//                                userdata.setObject(password!, forKey: "password")
//                                
//                                if image != nil{
//                                    let imagename = firstname!+"_"+lastname!+".jpg"
//                                    
//                                    //  create image data
//                                    let imagedata = UIImageJPEGRepresentation(image!,0.7)
//                                  
//                                    //  create parse file to share in cloud
//                                    let parseimagefile = PFFile(name: imagename, data: imagedata!)!
//                                    print("ssss")
//                                    print(parseimagefile)
//                                    userdata.setObject(parseimagefile, forKey: "photo")
//                                }
//                                userdata.saveInBackgroundWithBlock { (succeeded, error) -> Void in
//                                    if error == nil {
//                                       
//                                        if let navController = self.navigationController {
//                                            navController.popViewControllerAnimated(true)
//                                        }
//                                        
//                                    } else {
//                                        let checkfailed = UIAlertController(title: "Failure", message: "Subcribes are failed!", preferredStyle: UIAlertControllerStyle.Alert)
//                                        
//                                        checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//                                        
//                                        self.presentViewController(checkfailed, animated: true, completion: nil)
//                                        return;
//                                    }
//                                }
                            }
                        }
                        else {
                            let alertLoginFailed = UIAlertController(title: "Connect Error", message: "Connection is failed!", preferredStyle: UIAlertControllerStyle.Alert)
                                
                            alertLoginFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                
                            self.presentViewController(alertLoginFailed, animated: true, completion: nil)
                                
                        }
                    }
                    
                    
                }
                else{
                    let checkfailed = UIAlertController(title: "Subcribe Error", message: "Your car is not registed in ELAT", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(checkfailed, animated: true, completion: nil)
                    return;
                }
                
            } else {
                let alertLoginFailed = UIAlertController(title: "Connect Error", message: "Connection is failed!", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertLoginFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertLoginFailed, animated: true, completion: nil)
                
            }
        }
        
        //  save data of users using custom table
        
        
        
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
