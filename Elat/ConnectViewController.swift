//
//  ConnectViewController.swift
//  Elat
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var email_login: UITextField!
    
    @IBOutlet weak var password_login: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }

    @IBAction func OnBackButtonClick(sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
   
    @IBAction func OnLoginButtonClick(sender: AnyObject) {
        let email = self.email_login.text
        let password = self.password_login.text
    
        
        if(email == "" || password == "")
        {
            //display alert message
            let checkfailed = UIAlertController(title: "Input Error", message: "All fields are required!", preferredStyle: UIAlertControllerStyle.Alert)
            
            checkfailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(checkfailed, animated: true, completion: nil)
            return;
        }
        
        // standard User table
        
        PFUser.logInWithUsernameInBackground(email!, password : password!) { (user, error) -> Void in
            if user != nil
            {
                //login is successfull
                is_not = "No";
                let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("tabbarview") as UIViewController
                self.presentViewController(viewController, animated: true, completion: nil)
                
            }
            else{
                let alertLoginFailed = UIAlertController(title: "Login Failed", message: "Your email or password is invalid!", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertLoginFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertLoginFailed, animated: true, completion: nil)
            }
            
        }
        
        
        /* //login using custom table

        let query = PFQuery(className: "Users")
        query.whereKey("email", equalTo: email!)
        query.whereKey("password", equalTo: password!)
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                if objects!.count>0 {
                    let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("tabbarview") as UIViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                }
                else{
                    let alertLoginFailed = UIAlertController(title: "Login Failed", message: "Your email or password is invalid!", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alertLoginFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(alertLoginFailed, animated: true, completion: nil)
                }

            } else {
                let alertLoginFailed = UIAlertController(title: "Connect Error", message: "Connection is failed!", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertLoginFailed.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alertLoginFailed, animated: true, completion: nil)
                
            }
        }*/
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */
    }
}
