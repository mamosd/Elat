//
//  CustomTableViewCell.swift
//  Elat
//
//  Created by admin on 1/4/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

 
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
  
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
