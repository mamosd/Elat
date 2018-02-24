//
//  NewsDetailViewController.swift
//  Elat
//
//  Created by admin on 1/4/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var titletxt = String()
    var timetxt = String()
    var contenttxt = String()
//    var imagedata : PFFile
    
    var userArray : NSMutableArray = []
    var row = Int()
    
    @IBOutlet weak var imagefield: UIImageView!
    @IBOutlet weak var titlefield: UILabel!
    @IBOutlet weak var timefield: UILabel!
   
    @IBOutlet weak var contentfield: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        titlefield.text = userArray[row]["title"] as? String
//        timefield.text = userArray[row]["time"] as? String
        contentfield.text = userArray[row]["content"] as? String
       
        let pfimage = userArray[row]["image"] as! PFFile
        
        pfimage.getDataInBackgroundWithBlock({
            (result, error) in
            self.imagefield.image = UIImage(data: result!)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnBackClick(sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
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
