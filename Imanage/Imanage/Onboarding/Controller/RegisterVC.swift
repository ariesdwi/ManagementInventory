//
//  RegisterVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 02/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var storeNameTF: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!
    

        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            self.hideKeyboardWhenTappedOutside()
        }
        

    @IBAction func confirmPassChanged(_ sender: UITextField) {
        guard let password      = self.passTF.text else { return }
        guard let confirmPass   = self.confirmPassTF.text else { return }
        
        if password != confirmPass {
            ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Password and Confirm Password must be the same!")
        }
        
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        guard let fullName      = self.nameTF.text else { return }
        guard let email         = self.emailTF.text else { return }
        guard let storeName     = self.storeNameTF.text else { return }
        guard let phoneNumber   = self.phoneNumber.text else { return }
        guard let password      = self.passTF.text else { return }
        guard let confirmPass   = self.confirmPassTF.text else { return }
        
        //simple validation
        if email == "" || password == "" || fullName == "" || storeName == "" || phoneNumber == "" {
            ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Please fill out all the field!")
        }
        if password != confirmPass {
            ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Password and Confirm Password must be the same!")
        }
        
        let registerMdl = ModelRegister(fullname: fullName, email: email, storeName: storeName, phoneNumber: phoneNumber, storePhoneNumber: phoneNumber, password: password, username: email)
        print("registerModel = \(registerMdl)")
        APIManager.shareInstance.callingRegisterAPI(registerModel: registerMdl) { (status, message) in
            if status {
                self.goLogin(email: email, password: password)
            }
            else {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Register Failed", alert_message: message)
            }
        }
        
        
    }
    
    func goLogin(email : String, password : String)
    {
        let modelLogin = ModelLogin(email: email, password: password)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin)
        {
            (status, errorMsg) in
                        
            if status
            {
                //ShowAlert.showSimpleAlert(vc: self, alert_title: "Login Success", alert_message: errorMsg)
                print("UserDef Acc Id = \(UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey) )")
                print("UserDef Token = \(UserDefaults.standard.string(forKey: APIManager.shareInstance.userTokenKey) ?? "")")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeTabBarStoryboard") as! UITabBarController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
            else {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Login Failed", alert_message: errorMsg)
            }
            
        }
    }
        
    

}
