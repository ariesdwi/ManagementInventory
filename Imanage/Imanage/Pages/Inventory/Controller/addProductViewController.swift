//
//  addProductViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

protocol reloadDataDelegate {
    func refreshData()
}

class addProductViewController: UIViewController {
   
    var refreshtable:reloadDataDelegate?

    @IBOutlet var productName: UITextField!
    @IBOutlet var productDescription: UITextField!
    @IBOutlet var price: UITextField!
    @IBOutlet var stockProduct: UITextField!
    @IBOutlet var colorProduct: UITextField!
    @IBOutlet var weightProduct: UITextField!
    @IBOutlet var skuProduct: UITextField!
    
    @IBOutlet var newBtn: UIButton!
    @IBOutlet var oldBtn: UIButton!
    @IBOutlet var addBtnProduct: UIButton!
    
    
    var newProduct = true
    
//   var listofProduct = [productDetail]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedOutside()

        addBtnProduct.layer.cornerRadius = 10

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
    
    
    @IBAction func newbtnAction(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            oldBtn.isSelected = false
        } else {
            sender.isSelected = true
            oldBtn.isSelected = false
            newProduct = true
        }
    }
    
    
    @IBAction func oldbtnAction(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            newBtn.isSelected = false
        } else {
            sender.isSelected = true
            newBtn.isSelected = false
            newProduct = false
        }
    }
    
  
    
    @IBAction func addactionProduct(_ sender: Any) {
        
        guard let name = self.productName.text else {return}
        guard let sku = self.skuProduct.text else {return}
        guard let stock = self.stockProduct.text else {return}
        guard let weight = self.weightProduct.text else {return}
        guard let price = self.price.text else {return}
        guard let description = self.productDescription.text else {return}
        guard let color = self.colorProduct.text else {return}
        
        let condition = newProduct
        
        let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
        

        let addProduct = modelProduct(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, condition: condition, accountId: accountID)
        
        APIManager.shareInstance.addProductAPI(addProduct: addProduct)
//        refreshtable.refreshT(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, accountId: accountID)
        refreshtable?.refreshData()
        dismiss(animated: true, completion: nil)
    }
    
    
}
