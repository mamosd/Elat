//
//  ListViewController.swift
//  Elat
//
//  Created by admin on 1/13/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

import CoreLocation

class ListViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet var tblview: UITableView!
    
    var manager:CLLocationManager!
    
    var GaragesArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadParseData()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadParseData()
    {
        let query = PFQuery(className: "Garages")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                for object in objects! {
                    self.GaragesArray.addObject(object)
                }
                self.tblview.reloadData()
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
        return self.GaragesArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Allocates a Table View Cell
        let aCell =
        self.tblview.dequeueReusableCellWithIdentifier("listcell",
            forIndexPath: indexPath) as! ListTableViewCell
        // Sets the text of the Label in the Table View Cell
        
        let row = indexPath.row

        let title = GaragesArray[row]["name"] as! String
        let content = GaragesArray[row]["content"] as! String
        let pfimage = GaragesArray[row]["image"] as! PFFile
        
        pfimage.getDataInBackgroundWithBlock({
            (result, error) in
            
            aCell.imagefield.image = UIImage(data: result!)
        })
        
        aCell.titlefield.text = title
        aCell.contentfield.text = content

        return aCell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath = self.tblview.indexPathForSelectedRow!
        
        let destViewController = segue.destinationViewController as! ListDetailViewController
        
        destViewController.userArray  = GaragesArray
        destViewController.row = indexPath.row
        //        destViewController.titletxt = userArray[indexPath.row]["title"] as! String
        //        destViewController.contenttxt = userArray[indexPath.row]["content"] as! String
        //        destViewController.timetxt = userArray[row]["content"] as! String
        //        destViewController.imagedata = userArray[indexPath.row]["image"] as! PFFile
        //         print(pfimage)
        //        pfimage.getDataInBackgroundWithBlock({
        //            (result, error) in
        //            destViewController.imagedata = UIImage(data: result!)!
        //        })
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
