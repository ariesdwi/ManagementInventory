//
//  ChooseOrderCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol orderItemCell:AnyObject {
    func addItemQty(produkId : Int, qtyStepper:Int)
}

class ChooseOrderCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var Stepper: GMStepper!
    
    var stepperProtocol : orderItemCell?
    
    var testValuestepper:Int = 0
    var produkId : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        testValuestepper = Int(Stepper.value)
        
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickStepper(_ sender: GMStepper) {
        print("onclickStepper \(Stepper.value)")
        stepperProtocol?.addItemQty(produkId : produkId, qtyStepper: Int(Stepper.value) )
    }
    
    
}
