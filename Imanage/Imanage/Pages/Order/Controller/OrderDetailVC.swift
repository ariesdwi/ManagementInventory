//
//  OrderDetailVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class OrderDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet var DetailTableView: UITableView!
    
    var invoiceId = ""
    var orderDate = ""
    var customerName = ""
    var shippingName = "JNE REG"
    var shippingTrackingNo = ""
    var customerPhone = ""
    var customerEmail = ""
    var customerAddress = ""
    var channelNotes = ""
    var additionalNotes = ""
    var shippingFee = 0
    var statusShip = "Shipped"
    var totalPrice = 0
    var id = 0
    var productId = 0
    var productsId = 0
    var accountId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "OrderBuyerInformationCell", bundle: nil )
               
        DetailTableView.register(nib, forCellReuseIdentifier: "OrderBuyerInformationCell")
        
        DetailTableView.dataSource = self
        DetailTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderBuyerInformationCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderBuyerInformationCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            
        }
       
        cell.InvoiceLabel.text = invoiceId
        cell.orderDateLabel.text = orderDate
        cell.customerNameLabel.text = customerName
        cell.shippingNameLabel.text = shippingName
        cell.trackingNumberLabel.text = shippingTrackingNo
        cell.customerPhoneNumberLabel.text = customerPhone
        cell.emailLabel.text = customerEmail
        cell.customerAddressLabel.text = customerAddress
        cell.customerNotes.text = additionalNotes
        cell.channalEcommerceLabel.text = channelNotes
        cell.totalPriceShipping.text = String(shippingFee)
        cell.statusShipped.text = statusShip
        
        return cell
    }
    

}
