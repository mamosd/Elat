//
//  ProfileViewController.swift
//  Elat
//
//  Created by admin on 1/4/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

var currentUser = PFUser.currentUser()

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernamefield: UILabel!
    @IBOutlet weak var birthdayfield: UILabel!
    @IBOutlet weak var poinfield: UILabel!
    @IBOutlet weak var phonefield: UILabel!
    @IBOutlet weak var emaileild: UILabel!
    @IBOutlet weak var brandfield: UILabel!
    @IBOutlet weak var carnumberfield: UILabel!
    @IBOutlet weak var kilometersfield: UILabel!
    @IBOutlet weak var userphotofield: UIImageView!
    @IBOutlet weak var carimagefield: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSLog(is_not)
        if is_not == "Yes" {
            let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("startview") as UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        }
        else{
            loaddata()
        }// hide navigation bar
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loaddata(){
 
        usernamefield.text = (currentUser!.objectForKey("firstname") as! String) + " " + (PFUser.currentUser()?.objectForKey("lastname") as! String)
        birthdayfield.text = (currentUser!.objectForKey("birthday") as! String)
        phonefield.text = (currentUser!.objectForKey("phone") as! String)
        emaileild.text = (currentUser!.objectForKey("email") as! String)
        carnumberfield.text = (currentUser!.objectForKey("carnumber") as! String)
        kilometersfield.text = (currentUser!.objectForKey("kilometers") as! String) + "Km"
       
        let query = PFUser.query
        
        query()!.whereKey("username", equalTo: (currentUser!.objectForKey("email"))!)
        query()!.getFirstObjectInBackgroundWithBlock {
            (object: PFObject?, error: NSError?) -> Void in
            if error != nil || object == nil {
                return
            } else {
                // The find succeeded.
                if let userPicture : PFFile = object?.objectForKey("photo") as? PFFile {
                    userPicture.getDataInBackgroundWithBlock({
                        (result, error) in
                        self.userphotofield.image = UIImage(data: result!)
                    })
                }
            }
        }
        
        let subquery = PFQuery(className: "ELATCustomer")
        subquery.whereKey("carnumber", equalTo: (currentUser!.objectForKey("carnumber") as! String))
        subquery.getFirstObjectInBackgroundWithBlock { (object: PFObject?, error: NSError?) -> Void in
            if error == nil {
                if let carPicture : PFFile = object?.objectForKey("photo") as? PFFile {
                    carPicture.getDataInBackgroundWithBlock({
                        (result, error) in
                        self.carimagefield.image = UIImage(data: result!)
                    })
                }
                self.brandfield.text = object?.objectForKey("brand") as? String
            } else {
                return
            }
        }
    
    }
    
    func updatekilometers(){
        print("sss")
    }

    @IBAction func OnUpdateButtonClick(sender: AnyObject) {
        let alert = UIAlertController(title: "Update", message: "Kilometers Update", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Enter kilometer:"
            })
        
        alert.addAction(UIAlertAction(title: "ok", style: .Default){(_) in
                let nameTextField = alert.textFields![0]
                self.updatekilometers(nameTextField.text!)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updatekilometers(kilometers : String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // 1
        self.kilometersfield.text = kilometers + " Km"
    // 2
        if let currentUser = PFUser.currentUser(){
            currentUser["kilometers"] = kilometers
            //set other fields the same way....
            currentUser.saveInBackground()
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
