//
//  ViewController.swift
//  Elat
//
//  Created by admin on 1/3/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //click "I am not a elat customer" button
    @IBAction func OnNotButtonClick(sender: AnyObject) {
        is_not = "Yes";
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("tabbarview") as UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
    }

}

