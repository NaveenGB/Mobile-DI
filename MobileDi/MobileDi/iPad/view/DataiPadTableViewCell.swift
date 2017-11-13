//
//  DataiPadTableViewCell.swift
//  MobileDi
//
//  Created by Naveen Bannikoppa on 12/11/17.
//  Copyright © 2017 Naveen Bannikoppa. All rights reserved.
//

import UIKit
import Cosmos

class DataiPadTableViewCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var ratingView: CosmosView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layoutIfNeeded()
        img.layer.borderWidth = 0.5
        img.layer.masksToBounds = false
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.cornerRadius = img.frame.size.height/2
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
