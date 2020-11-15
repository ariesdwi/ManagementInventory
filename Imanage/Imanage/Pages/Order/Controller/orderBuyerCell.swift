//
//  orderBuyerCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol orderBuyerCellDelegate {
    func textFieldOrder1(date: String, name: String,address: String,email:String,phone:String)
}

class orderBuyerCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet var orderDateLabel: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!

    var orderdelegate: orderBuyerCellDelegate?
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        orderDateLabel.delegate = self
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        
        
    }


    func textFieldDidEndEditing(_ textField: UITextField) {
       guard let dates = self.orderDateLabel.text else {return}
       guard let names = self.nameTextField.text else {return}
       guard let addresss = self.addressTextField.text else {return}
       guard let emaill = self.emailTextField.text else {return}
       guard let phonee = self.phoneNumberTextField.text else {return}
        
     orderdelegate?.textFieldOrder1(date: dates, name: names, address: addresss, email: emaill, phone: phonee)
        print("date \(dates)")
        print("address \(addresss)")
        print("email \(emaill)")
        print("phone \(phonee)")
        print("name \(names)")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
