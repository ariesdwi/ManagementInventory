//
//  OrderBuyerInformationCell2.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 14/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class OrderBuyerInformationCell2: UITableViewCell {

    @IBOutlet var qtyLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        qtyLabel.layer.borderColor = UIColor.lightGray.cgColor
        qtyLabel.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
