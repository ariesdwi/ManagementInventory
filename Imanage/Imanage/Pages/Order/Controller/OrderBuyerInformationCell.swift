//
//  OrderBuyerInformationCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class OrderBuyerInformationCell: UITableViewCell {

    
    @IBOutlet var InvoiceLabel: UILabel!
    @IBOutlet var orderDateLabel: UILabel!
    @IBOutlet var channalEcommerceLabel: UILabel!
    @IBOutlet var statusShipped: UILabel!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var customerPhoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var customerAddressLabel: UILabel!
    @IBOutlet var customerNotes: UILabel!
    @IBOutlet var shippingNameLabel: UILabel!
    @IBOutlet var totalPriceShipping: UILabel!
    @IBOutlet var trackingNumberLabel: UILabel!
    
    
    @IBOutlet var prosesShipping: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prosesShipping.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
