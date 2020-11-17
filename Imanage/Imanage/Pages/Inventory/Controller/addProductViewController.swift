//
//  addProductViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit



class addProductViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
   
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
    
    @IBOutlet var imgOne: UIImageView!
   
    
    var imgPicker = UIImagePickerController()
    
    
    var newProduct = true
    
//   var listofProduct = [productDetail]()
    
    let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedOutside()

        addBtnProduct.layer.cornerRadius = 10
        imgPicker.delegate = self
        imgPicker.allowsEditing = true

    }
    
    
    
    @IBAction func uploadImage(_ sender: Any) {
       
        
               let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               
               alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (button) in
                   self.imgPicker.sourceType = .photoLibrary
                   self.present(self.imgPicker, animated: true, completion: nil)
               }))
               
               alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
                   self.imgPicker.sourceType = .camera
                   self.present(self.imgPicker, animated: true, completion: nil)
               }))
               
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
               
               present(alert, animated: true, completion: nil)
        
    }
    
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return }
         guard let name = self.productName.text else {return}
        
        let yourDataImagePNG = pickedImage.pngData()
        
        
        imgOne.image = pickedImage
        
        UserDefaults().set(yourDataImagePNG, forKey: "\(name)")
        
        dismiss(animated: true, completion: nil)
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
        
        let images = ["https://www.google.com/imgres?imgurl=https%3A%2F%2Fdigitalfinger.id%2Fwp-content%2Fuploads%2F2019%2F12%2Fno-image-available-icon-6-600x375.png&imgrefurl=https%3A%2F%2Fdigitalfinger.id%2Fcontent-creator-production-solution%2Fno-image-available-icon-6%2F&tbnid=hSQJAbuvkcanTM&vet=12ahUKEwjrnvSa5YjtAhVL13MBHZKRCV4QMygAegUIARClAQ..i&docid=DCc7fKFG7AJ7HM&w=600&h=375&q=No%20image&safe=strict&ved=2ahUKEwjrnvSa5YjtAhVL13MBHZKRCV4QMygAegUIARClAQ"]
        let condition = newProduct
        let addProduct = modelProduct(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, condition: condition, accountId: accountID,images: images)
        
        
        
        APIManager.shareInstance.addProductAPI(addProduct: addProduct)
//        refreshtable.refreshT(name: name, sku: sku, qty: Int(stock)!, weigh: Int(weight)!, price: Int(price)!, description: description, variant: color, accountId: accountID)
       
       
    }
    
    
}



