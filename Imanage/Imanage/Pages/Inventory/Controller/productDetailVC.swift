//
//  productDetailVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 05/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class productDetailVC: UIViewController {

    @IBOutlet var nameProductLabel: UILabel!
    @IBOutlet var descProductLabel: UILabel!
    @IBOutlet var priceProductLabel: UILabel!
    @IBOutlet var qtyProductLabel: UILabel!
    @IBOutlet var colorProductLabel: UILabel!
    @IBOutlet var weightProductLabel: UILabel!
    @IBOutlet var conditionProduct: UILabel!
    @IBOutlet var imageViewOne: UIImageView!
    @IBOutlet var weightTypes: UILabel!
    
    
    @IBOutlet var navbarTop: UIView!
    var nameProduct = ""
    var descProduct = ""
    var priceProduct = 0
    var qtyProduct = 0
    var colorProduct = ""
    var weightProduct = 0
    var condition = true
    var id = 0
    var imgUrl = ""
    var weightType = ""
    @IBOutlet var NavbarOrder: UINavigationItem!
    
    var detailofProduct = [productDetail]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        nameProductLabel.text = nameProduct
        descProductLabel.text = descProduct
        priceProductLabel.text = String(priceProduct)
        qtyProductLabel.text = String(qtyProduct)
        colorProductLabel.text = colorProduct
        weightProductLabel.text = String(weightProduct)
        
        if condition == true {
            conditionProduct.text = "New Product"
        } else {
            conditionProduct.text = "Old Product"
        }
        
        imageViewOne.downloaded(from: imgUrl)
        
        weightTypes.text = weightType
        
        // Do any additional setup after loading the view.
    }
    
    
    

    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "productEditStory" {
          if let nextViewController = segue.destination as? editProductVC {
            nextViewController.editname = nameProduct
            nextViewController.editdescProduct = descProduct
            nextViewController.editpriceProduct = priceProduct
            nextViewController.editqtyProduct = qtyProduct
            nextViewController.editcolorProduct = colorProduct
            nextViewController.editweightProduct = weightProduct
            nextViewController.editcondition = condition
            nextViewController.id = id
                  
          }
      }
  }
    
   @IBAction func unwindToDetail(_ unwindSegue: UIStoryboardSegue) {
       
     nameProductLabel.text = nameProduct
     descProductLabel.text = descProduct
     priceProductLabel.text = String(priceProduct)
     qtyProductLabel.text = String(qtyProduct)
     colorProductLabel.text = colorProduct
     weightProductLabel.text = String(weightProduct)
       // Use data from the view controller which initiated the unwind segue
   }
    
}


