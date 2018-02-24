//
//  ServiceViewController.swift
//  Elat
//
//  Created by admin on 1/6/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnRevisionButton(sender: AnyObject) {
        type = "revision"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnPanneButton(sender: AnyObject) {
        type = "panne"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnPneuButton(sender: AnyObject) {
        type = "pneu"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnBrisButton(sender: AnyObject) {
        type = "bris"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnCollisionButton(sender: AnyObject) {
        type = "collision"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnControlButton(sender: AnyObject) {
        type = "control"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnAssistanceButton(sender: AnyObject) {
        type = "assistance"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    @IBAction func OnContactButton(sender: AnyObject) {
        type = "contact"
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("servicedetail") as UIViewController
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
//    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        // handle tap events
//        print("You selected cell #\(indexPath.item)!")
//    };
//    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
