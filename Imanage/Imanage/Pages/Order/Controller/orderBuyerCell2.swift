//
//  orderBuyerCell2.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit


protocol orderBuyerCell2Delegate:AnyObject {
    func createOrder()
}

final class orderBuyerCell2: UITableViewCell {
    
    weak var delegate: orderBuyerCell2Delegate?
    
    @IBOutlet var paymentTextField: UITextField!
    @IBOutlet var shippingTextField: UITextField!
    @IBOutlet var shippingFeeTextField: UITextField!
    
    @IBOutlet var shippingTrackingTextField: UITextField!
    
    @IBOutlet var createOrderBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createOrderBtn.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func createOrder(_ sender: Any) {
        delegate?.createOrder()
    }
    
}


