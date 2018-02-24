//
//  MapViewController.swift
//  Elat
//
//  Created by admin on 1/13/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapview: MKMapView!
    var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapview.showsUserLocation = true
        loadParseData()
      
    }
    
    func loadParseData()
    {
        let query = PFQuery(className: "Garages")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                for object in objects! {
                    let annotation = MKPointAnnotation()
                    let coordinate = object["coordinate"] as? PFGeoPoint
                    annotation.coordinate = CLLocationCoordinate2DMake((coordinate?.latitude)!, (coordinate?.longitude)!)
                    annotation.title = object["name"] as? String
                    annotation.subtitle = object["content"] as? String
                    self.mapview.addAnnotation(annotation)
                }
            } else {
                print("There is an error")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func application(application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        return true
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
