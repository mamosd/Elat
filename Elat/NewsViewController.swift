//
//  NewsViewController.swift
//  Elat
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    var userArray : NSMutableArray = []
    
    @IBOutlet var tb: UITableView!
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            loadParseData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadParseData()
    {
        let query = PFQuery(className: "News")
        query.orderByDescending("createdAt")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                for object in objects! {
                      self.userArray.addObject(object)
                    }
                    self.tb.reloadData()
            } else {
                print("There is an error")
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int
    {
        return self.userArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        // Allocates a Table View Cell
        let aCell =
        self.tb.dequeueReusableCellWithIdentifier("CustomTableViewCell",
            forIndexPath: indexPath) as! CustomTableViewCell
        // Sets the text of the Label in the Table View Cell
        
        let row = indexPath.row
        let title = userArray[row]["title"] as! String
        let content = userArray[row]["content"] as! String
//        NSDate; *updated = [userArray[row] updatedAt];
//        let elapsedTime = NSDate().timeIntervalSinceDate(time)
//        print(time)
//        print(elapsedTime)
        let pfimage = userArray[row]["image"] as! PFFile

        pfimage.getDataInBackgroundWithBlock({
            (result, error) in
            
            aCell.img.image = UIImage(data: result!)
       })
        
    
        aCell.title.text = title
        aCell.detailLabel.text = content
        
        return aCell
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath = self.tb.indexPathForSelectedRow!
        
        let destViewController = segue.destinationViewController as! NewsDetailViewController
        
        destViewController.userArray  = userArray
        destViewController.row = indexPath.row
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
