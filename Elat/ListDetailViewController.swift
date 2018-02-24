//
//  ListDetailViewController.swift
//  Elat
//
//  Created by admin on 1/14/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ListDetailViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    var userArray : NSMutableArray = []
    var row = Int()
    
    @IBOutlet weak var imagefield: UIImageView!
    
    @IBOutlet weak var titlefield: UILabel!
   
    @IBOutlet weak var namefield: UILabel!
    
    @IBOutlet weak var contentfield: UILabel!
    
    @IBOutlet weak var phonefield: UILabel!
    
    @IBOutlet weak var opentimefield: UILabel!
    
    @IBOutlet weak var mapview: MKMapView!
    
    @IBAction func OnBackButtonClick(sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titlefield.text = userArray[row]["name"] as? String
        namefield.text = userArray[row]["name"] as? String
        contentfield.text = userArray[row]["content"] as? String
        phonefield.text = userArray[row]["phone"] as? String
        opentimefield.text = userArray[row]["opentime"] as? String
        
        let pfimage = userArray[row]["image"] as! PFFile
        
        pfimage.getDataInBackgroundWithBlock({
            (result, error) in
            self.imagefield.image = UIImage(data: result!)
        })
        let annotation = MKPointAnnotation()
        let coordinate = userArray[row]["coordinate"] as? PFGeoPoint
        annotation.coordinate = CLLocationCoordinate2DMake((coordinate?.latitude)!, (coordinate?.longitude)!)
        annotation.title = userArray[row]["name"] as? String
        annotation.subtitle = userArray[row]["content"] as? String
        self.mapview.addAnnotation(annotation)
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

    
}
