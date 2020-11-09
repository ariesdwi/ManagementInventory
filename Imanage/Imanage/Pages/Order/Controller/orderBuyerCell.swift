//
//  orderBuyerCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol FieldStyle1Delegate {
    func textChange(text: String, tag: NSInteger)
}

class orderBuyerCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet var orderDateLabel: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!

    var delegate: FieldStyle1Delegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameTextField.delegate = self
        nameTextField.tag = 0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
