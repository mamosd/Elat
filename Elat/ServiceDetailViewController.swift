//
//  ServiceDetailViewController.swift
//  Elat
//
//  Created by admin on 1/12/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ServiceDetailViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var listview: UIView!
    @IBOutlet weak var mapview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listview.hidden = false
        mapview.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnBackButtonClick(sender: AnyObject) {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }

    @IBAction func OnSegChanged(sender: AnyObject) {
        switch segControl.selectedSegmentIndex
            {
        case 0:
            listview.hidden = false
            mapview.hidden = true
        case 1:
            listview.hidden = true
            mapview.hidden = false
        default:
            break;
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
