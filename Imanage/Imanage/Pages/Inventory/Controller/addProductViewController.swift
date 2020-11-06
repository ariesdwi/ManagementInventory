//
//  addProductViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol reloadDataDelegate {
    func refreshT(name: String, sku: String, qty: Int, weigh: Int, price: Int, description: String, variant: String, accountId: Int)
}

class addProductViewController: UIViewController {
   
    var refreshtable:reloadDataDelegate!

    @IBOutlet var productName: UITextField!
    @IBOutlet var productDescription: UITextField!
    @IBOutlet var price: UITextField!
    @IBOutlet var stockProduct: UITextField!
    @IBOutlet var colorProduct: UITextField!
    @IBOutlet var weightProduct: UITextField!
    @IBOutlet var skuProduct: UITextField!
    
//   var listofProduct = [productDetail]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedOutside()
    }
    @IBAction func uploadImage(_ sender: Any) {
        let alertController = UIAlertController(title: "Upload Image", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Ambil Foto", style: .default, handler: self.okHandler))
        alertController.addAction(UIAlertAction(title: "Galeri Foto", style: .default, handler: self.okHandler))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func okHandler(alert: UIAlertAction){
        
    }
    
  
    
    @IBAction func addactionProduct(_ sender: Any) {
        
        guard let name = self.productName.text else {return}
        guard let sku = self.skuProduct.text else {return}
        guard let stock = self.stockProduct.text else {return}
        guard let weight = self.weightProduct.text else {return}
        guard let price = self.price.text else {return}
        guard let description = self.productDescription.text else {return}
        guard let color = self.colorProduct.text else {return}
        let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
        

        let addProduct = modelAddProduct(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, accountId: accountID)
        
        APIManager.shareInstance.addProductAPI(addProduct: addProduct)
//        refreshtable.refreshT(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, accountId: accountID)
               
        dismiss(animated: true, completion: nil)
    }
    
}
