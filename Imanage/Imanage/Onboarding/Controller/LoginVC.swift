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
    

    @IBAction func btnLogin(_ sender: Any)
    {
        guard let email = self.emailField.text else {return}
        guard let password = self.passwordField.text else {return}
    
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
