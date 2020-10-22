//
//  OrderTableViewCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 21/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet var OrderNameLabel: UILabel!
    @IBOutlet var SkuLabel: UILabel!
    
    @IBOutlet var DateLabel: UILabel!
    @IBOutlet var Channel: UILabel!
    @IBOutlet var ProgressLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
