//
//  orderBuyerCell2.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit


protocol orderBuyerCell2Delegate {
    func createOrder()
    func textFieldOrder2(payment: String, shipping: String, Fee: String,trackingShip:String)
    
}

class orderBuyerCell2: UITableViewCell, UITextFieldDelegate {
    
     var delegate: orderBuyerCell2Delegate?
    
    @IBOutlet var paymentTextField: UITextField!
    @IBOutlet var shippingTextField: UITextField!
    @IBOutlet var shippingFeeTextField: UITextField!
    
    @IBOutlet var shippingTrackingTextField: UITextField!
    
    @IBOutlet var createOrderBtn: UIButton!
    
    @IBOutlet var totalPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createOrderBtn.layer.cornerRadius = 10
        // Initialization code
        
        paymentTextField.delegate = self
        shippingTextField.delegate = self
        shippingFeeTextField.delegate = self
        shippingTrackingTextField.delegate = self
       
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
       guard let payment = self.paymentTextField.text else {return}
       guard let shipping = self.shippingTextField.text else {return}
       guard let feeshipping = self.shippingFeeTextField.text else {return}
       guard let track = self.shippingTrackingTextField.text else {return}
        
        delegate?.textFieldOrder2(payment: payment, shipping: shipping, Fee: feeshipping, trackingShip: track)
        print("date \(payment)")
        print("address \(shipping)")
        print("email \(feeshipping)")
        print("phone \(track)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func createOrder(_ sender: Any) {
        delegate?.createOrder()
        
    }
    
}


