//
//  editProductVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 05/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class editProductVC: UIViewController {

    
    @IBOutlet var nameProduct: UITextField!
    @IBOutlet var descProduct: UITextView!
    @IBOutlet var priceProduct: UITextField!
    @IBOutlet var colorProduct: UITextField!
    @IBOutlet var stockProduct: UITextField!
    @IBOutlet var weightProduct: UITextField!
    @IBOutlet var conditionProduct: UITextField!
    
    var editname = ""
    var editdescProduct = ""
    var editpriceProduct = 0
    var editqtyProduct = 0
    var editcolorProduct = ""
    var editweightProduct = 0
    var editcondition = true
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        nameProduct.text = editname
        descProduct.text = editdescProduct
        priceProduct.text = String(editpriceProduct)
        stockProduct.text = String(editqtyProduct)
        colorProduct.text = editcolorProduct
        weightProduct.text = String(editweightProduct)
        
        if editcondition == true {
            conditionProduct.text = "New Product"
        } else {
            conditionProduct.text = "Old Product"
        }
        
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
       let editname = nameProduct.text!
       let editdescProduct = descProduct.text!
       let editpriceProduct = Int(priceProduct.text!)!
       let editqtyProduct = Int(stockProduct.text!)!
       let editcolorProduct = colorProduct.text!
       let editweightProduct = Int(weightProduct.text!)!
       let editcondition = true
        let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
        
       let updateProduct = productDetail(name: editname, qty:editqtyProduct , price: editpriceProduct, id: id, description: editdescProduct, variant: editcolorProduct, weight: editweightProduct, condition: editcondition, accountId: accountID)
        
        APIManager.shareInstance.editProduct(editProduct: updateProduct)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! productDetailVC
        detailVC.nameProduct = nameProduct.text!
    }
}
