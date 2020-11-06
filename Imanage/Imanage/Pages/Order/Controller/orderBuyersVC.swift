//
//  orderBuyersVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class orderBuyersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    let myData = ["Alarm Clock","Coffee Mug","Daily notebook","Wooden Frame","Desk Lamp"]
    
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
    
    @IBOutlet var orderTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "orderBuyerCell", bundle: nil )
        let nib2 = UINib(nibName: "orderListCell", bundle: nil )
        let nib3 = UINib(nibName: "orderBuyerCell2", bundle: nil )
        
        orderTableView.register(nib, forCellReuseIdentifier: "orderBuyerCell")
        orderTableView.register(nib2, forCellReuseIdentifier: "orderListCell")
        orderTableView.register(nib3, forCellReuseIdentifier: "orderBuyerCell2")
        
        orderTableView.delegate = self
        orderTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
       
        
    }
    

    func yourFunction(Sender: Any){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 1 {
            let cellIdentifier = "orderBuyerCell"
            guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? orderBuyerCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            orderDate = cell.orderDateLabel.text!
            customerName = cell.nameTextField.text!
            customerPhone = cell.phoneNumberTextField.text!
            customerAddress = cell.addressTextField.text!
            customerEmail = cell.emailTextField.text!
            
            return cell
        }
        
        
        let cellIdentifier = "orderListCell"
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? orderListCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.orderListName.text = myData[indexPath.row]
        cell.orderlistImageView.backgroundColor = .red
        
        
        
        if indexPath.row == myData.count - 1 {
            let cellIdentifier = "orderBuyerCell2"
            guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? orderBuyerCell2 else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            shippingTrackingNo = cell.shippingTrackingTextField.text!
//            shippingFee = Int(cell.shippingFeeTextField.text ?? "")!
            
            cell.delegate = self
            
            return cell
        }
        
        let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
       
        return cell
        
    }
    
}


extension orderBuyersVC: orderBuyerCell2Delegate {
    func createOrder() {
        let addOrder = addOrders(invoiceId: invoiceId, orderDate: orderDate, customerName: customerName, shippingTrackingNo: shippingTrackingNo, customerPhone: customerPhone, customerEmail: customerEmail, customerAddress: customerAddress, channelNotes: channelNotes, additionalNotes: additionalNotes, shippingFee: shippingFee, totalPrice: totalPrice, productId: productId, productsId: productsId, accountId: accountId)
        APIManager.shareInstance.addOrderAPI(addOrder: addOrder)
    }
}
