//
//  LoginEcommerceVC.swift
//  Imanage
//
//  Created by Grace Cindy on 23/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class LoginEcommerceVC: UIViewController {

    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var pageLogoIV: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    
    
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var loginOTP: UITextField!
    
    @IBOutlet weak var otpSubmitBtn: UIButton!
    
    var loginUser = ""
    var loginType = ""
    var password  = ""
    var result = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedOutside()
        
        loginView.isHidden = false
        otpView.isHidden = true
    }
    
    @IBAction func actionLoginTokped(_ sender: UIButton)
    {
        var userTokpedIDFromAPI : Int!
        let userAccId = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
        
        if sender == btnLogin {
                        
            if loginEmail.text == "" || loginPassword.text == "" {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Field cannot be empty")
            }
            else if !(loginEmail.text!.contains("@") ) || !loginEmail.text!.contains(".")
            {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Email format must contain '@' & '.'")
            }
            else if loginPassword.text!.count < 8 {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Password must be at least 8 characters")
            }
            else {
                loginView.isHidden = true
                otpView.isHidden = false
                
                let loginUser = TokpedLoginEmail(email: loginEmail.text!, password: loginPassword.text!, userId : userAccId )
                
                APIManager.shareInstance.loginTokped(modelTokpedLogin: loginUser) {
                    (status, msg, userTokpedID) in
                        print("userAccID = \(userTokpedID)")
                    userTokpedIDFromAPI = userTokpedID
                }
                
            }
            
            
        }
        else if sender == otpSubmitBtn {
            if loginOTP.text == "" {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Field cannot be empty")
            }
            if loginOTP.text!.count < 4 {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "OTP must be at least 4 digits")
            }
            else {
                
                let otpText : Int = Int(loginOTP.text!)!                
                
                let loginUserVerif = TokpedLoginVerif(tokpedAccID: userTokpedIDFromAPI, pin: otpText, type: "email", userId: userAccId)
                APIManager.shareInstance.loginTokpedVerif(modelTokpedVerif: loginUserVerif) { (status, msg) in
                    
                    print("LoginCommerceVC status = \(status)")
                    self.result = status
                    self.performSegue(withIdentifier: "connectionResultSegue", sender: self)
                }
                
            }
            
            
        }
    }
        
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connectionResultSegue"
        {
            if let vc = segue.destination as? LoginCommerceResult {
                print("prepareSegue in LoginCommerceVC = \(self.result)")
                vc.resultStatus = self.result
            }
            
        }
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   
}
