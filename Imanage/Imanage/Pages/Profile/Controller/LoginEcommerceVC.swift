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
        
        loginView.isHidden = false
        otpView.isHidden = true
    }
    
    @IBAction func actionLoginTokped(_ sender: UIButton)
    {
        var userTokpedIDFromAPI : Int!
        
        if sender == btnLogin {
            loginView.isHidden = true
            otpView.isHidden = false
            
            if loginEmail.text == "" || loginPassword.text == "" {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Field cannot be empty")
            }
            
            let loginUser = TokpedLoginEmail(email: loginEmail.text!, password: loginPassword.text!)
            
            APIManager.shareInstance.loginTokped(modelTokpedLogin: loginUser) {
                (status, msg, userTokpedID) in
                    print("userAccID = \(userTokpedID)")
                userTokpedIDFromAPI = userTokpedID
            }
        }
        else if sender == otpSubmitBtn {
            if loginOTP.text == "" {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "Field cannot be empty")
            }
            if loginOTP.text?.count != 6 {
                ShowAlert.showSimpleAlert(vc: self, alert_title: "Warning!", alert_message: "OTP must be 6 digits")
            }
            
            var otpText : Int = Int(loginOTP.text!)!
            
            
            let loginUserVerif = TokpedLoginVerif(tokpedAccID: userTokpedIDFromAPI, pin: otpText, type: "email")
            APIManager.shareInstance.loginTokpedVerif(modelTokpedVerif: loginUserVerif) { (status, msg) in
                self.result = status
                self.performSegue(withIdentifier: "connectionResultSegue", sender: self)
            }
        }
    }
        
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connectionResultSegue"
        {
            guard let vc = segue.destination as? LoginCommerceResult else { return }
            vc.resultStatus = result
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
