//
//  RegisterViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var emailTextfield: UITextField!
    
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var handphoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func btnSignUp(_ sender: Any) {
        
        guard let username = self.nameLabel.text else {return}
        guard let email = self.emailTextfield.text else {return}
        guard let password = self.passwordTextField.text else {return}
        guard let fullname = self.fullNameTextField.text else {return}
        guard let handphoneNumber = self.handphoneNumber.text else {return}
        
        let register = RegisterModel(email: email, username: username, password: password, phoneNumber: handphoneNumber, fullname: fullname)
        APIManager.shareInstance.callingRegisterAPI(register: register)
    }
    
}
