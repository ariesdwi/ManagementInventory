//
//  addProductViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class addProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
}
