//
//  LoginVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogin(_ sender: Any) {
        guard let email = self.emailField.text else {return}
        guard let password = self.passwordField.text else {return}
    
      let modelLogin = ModelLogin(email: email, password: password)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin)
    }

}
