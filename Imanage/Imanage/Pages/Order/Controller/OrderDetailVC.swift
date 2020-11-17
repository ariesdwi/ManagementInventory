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
    var channelName = ""
    var additionalNotes = ""
    var shippingFee = 0
    var statusShip = "On Process"
    var totalPrice = 0
    var id = 0
    var productId = 0
    var productsId = 0
    var accountId = 0
    var qty = 0
    var listofProduct = [productDetail]() {
           didSet {
               DispatchQueue.main.async {
                   self.DetailTableView.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedOutside()
        
        let nib = UINib(nibName: "OrderBuyerInformationCell", bundle: nil )
        let nib2 = UINib(nibName: "OrderBuyerInformationCell2", bundle: nil )
        let nib3 = UINib(nibName: "EmptyCell", bundle: nil )
        
        DetailTableView.register(nib, forCellReuseIdentifier: "OrderBuyerInformationCell")
        DetailTableView.register(nib2, forCellReuseIdentifier: "OrderBuyerInformationCell2")
        DetailTableView.register(nib3, forCellReuseIdentifier: "EmptyCell")
        
        DetailTableView.dataSource = self
        DetailTableView.delegate = self
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = DetailTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
//                          fatalError("The dequeued cell is not an instance of MealTableViewCell.")
//        }
        guard let cell = DetailTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
                      fatalError("The dequeued cell is not an instance of MealTableViewCell.")
                  }
                  
     
        
    
        
        
        if indexPath.section == 0 && indexPath.row < 1 {
           let cellIdentifier = "OrderBuyerInformationCell"
            guard let cell = DetailTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderBuyerInformationCell else {
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
            cell.channalEcommerceLabel.text = channelName
            cell.totalPriceShipping.text = String(shippingFee)
            cell.statusShipped.text = statusShip
            return cell
        }
        
        if indexPath.section == 1{
            let cellIdentifier = "OrderBuyerInformationCell2"
            guard let cell = DetailTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderBuyerInformationCell2 else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            guard let cell1 = DetailTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            let produkDetail = listofProduct[indexPath.row]
            print("OrderDetailVC line 121 : var qty = \n\(self.qty) | \(self.customerName) | \(self.productId) | \(produkDetail.price)")
            let quantity = "\(self.qty)"
            let price = "\(produkDetail.price)"
            let completeImage = produkDetail.images?[0]
            let idProduk = produkDetail.id
            let calculatedPrice = produkDetail.price * self.qty
            let calculatedPriceStr = "Rp. \(calculatedPrice)"
            
            let produkSku = (produkDetail.sku ?? "") as String
            var titleProduk = produkDetail.name
            if produkSku != nil || produkSku != "" {
                titleProduk = "\(produkSku) - \(produkDetail.name)"
            }
            
            if idProduk == productId {
                
                cell.productNameLabel.text = titleProduk
                cell.priceLabel.text = calculatedPriceStr
                cell.qtyLabel.text = quantity
                return cell
            } else {
                return cell1
            }
            
            
            return cell
        }
        
        return cell
    }
    

}
