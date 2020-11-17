//
//  orderBuyersVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class orderBuyersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedProducts : [Int:Double] = [:]
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
    var qty = 0
    
  
    @IBOutlet var orderTableView: UITableView!
    
    var listofProduct = [productDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.orderTableView.reloadData()
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedOutside()
        let nib = UINib(nibName: "orderBuyerCell", bundle: nil )
        let nib2 = UINib(nibName: "ChooseOrderCell", bundle: nil )
        let nib3 = UINib(nibName: "orderBuyerCell2", bundle: nil )
        let nib4 = UINib(nibName: "EmptyCell", bundle: nil )
        
        orderTableView.register(nib, forCellReuseIdentifier: "orderBuyerCell")
        orderTableView.register(nib2, forCellReuseIdentifier: "ChooseOrderCell")
        orderTableView.register(nib3, forCellReuseIdentifier: "orderBuyerCell2")
        orderTableView.register(nib4, forCellReuseIdentifier: "EmptyCell")
        
        orderTableView.delegate = self
        orderTableView.dataSource = self
        // Do any additional setup after loading the view.
        let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
        let productID = UserDefaults.standard.integer(forKey: "produkIds")
        let qtyStepper = UserDefaults.standard.integer(forKey: "qtyStepper")
        
        qty = Int(qtyStepper)
        productId = productID
        productsId = productID
        accountId = accountID
        APIManager.shareInstance.getInventoryProduct{ [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let produks):
                self?.listofProduct = produks
            }
        }
        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        guard let cell = orderTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
                   fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        if indexPath.section == 0 && indexPath.row < 1 {
            let cellIdentifier = "orderBuyerCell"
            guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? orderBuyerCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
     
            
            cell.orderdelegate = self
         
            print(orderDate)
            return cell
        }
        
        if indexPath.section == 1 {
            let cellIdentifier = "ChooseOrderCell"
            guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChooseOrderCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            guard let cell1 = orderTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
                              fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            let produkDetail = listofProduct[indexPath.row]
            let quantity = "\(produkDetail.qty)"
            let price = "\(produkDetail.price)"
            let completeImage = produkDetail.images?[0] ?? ""
            let idProduk = produkDetail.id
            
            if selectedProducts[idProduk] ?? 0 != 0 {
               cell.productNameLabel.text = produkDetail.name
               cell.priceLabel.text = price
               cell.productImageView.downloaded(from: completeImage)
               cell.Stepper.value = selectedProducts[idProduk] ?? 0
            return cell
            } else {
            return cell1
            }
        }
        
            
        if indexPath.section == 2 && indexPath.row == 0 {
            let cellIdentifier = "orderBuyerCell2"
            guard let cell = orderTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? orderBuyerCell2 else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            shippingTrackingNo = cell.shippingTrackingTextField.text!
            shippingName = cell.shippingTextField.text!
            shippingFee = Int(cell.shippingFeeTextField.text!) ?? 0
            //            shippingFee = Int(cell.shippingFeeTextField.text ?? "")!
            
            cell.delegate = self
           
            return cell
        }
        
        return cell
    }    
}


extension orderBuyersVC: orderBuyerCell2Delegate {
    func textFieldOrder2(payment: String, shipping: String, Fee: String, trackingShip: String) {
        channelNotes = payment
        shippingName = shipping
        shippingFee = Int(Fee) ?? 0
        shippingTrackingNo = trackingShip
    }
    
    func createOrder() {
    var addOrder = addOrders(invoiceId: invoiceId, orderDate: orderDate, customerName: customerName, shippingTrackingNo: shippingTrackingNo, customerPhone: customerPhone, customerEmail: customerEmail, customerAddress: customerAddress, channelNotes: channelNotes, additionalNotes: additionalNotes, shippingFee: shippingFee, totalPrice: totalPrice, productId: productId, productsId: productsId, accountId: accountId, qty: qty)
     APIManager.shareInstance.addOrderAPI(addOrder: addOrder)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChooseOrderVC") as! ChooseOrderVC
        self.navigationController?.popToRootViewController(animated: true)
       
    }
    
}

extension orderBuyersVC:orderBuyerCellDelegate{
    
    func textFieldOrder1(date: String, name: String, address: String, email: String, phone: String) {
        orderDate = date
        customerName = name
        customerEmail = email
        customerAddress = address
        customerPhone = phone
        print(date)
        print(name)
        print(address)
        print(email)
        print(phone)
    }
    
}
