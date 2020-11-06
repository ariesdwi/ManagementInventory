//
//  buttonNextCell.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 27/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol buttonNextCellDelegate:AnyObject {
    func chooseOrder()
}

final class buttonNextCell: UITableViewCell {

    weak var delegateChooseOrder: buttonNextCellDelegate?
    
    @IBOutlet var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nextButton.layer.cornerRadius = 10
     
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func chooseOrder(_ sender: Any) {
        delegateChooseOrder?.chooseOrder()
    }
}

