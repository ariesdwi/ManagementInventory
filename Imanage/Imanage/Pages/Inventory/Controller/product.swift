//
//  product.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 19/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class product: UITableViewCell {

    @IBOutlet var labelProduct: UILabel!
    @IBOutlet var imageProduct: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var QuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
