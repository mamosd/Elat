//
//  ListTableViewCell.swift
//  Elat
//
//  Created by admin on 1/13/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var imagefield: UIImageView!
    @IBOutlet weak var titlefield: UILabel!
    @IBOutlet weak var contentfield: UILabel!
    @IBOutlet weak var distance: UILabel!

    
//    @IBOutlet weak var ratingcontrol: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
