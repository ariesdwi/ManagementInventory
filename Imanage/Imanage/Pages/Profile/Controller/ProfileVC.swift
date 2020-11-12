//
//  ProfileVC.swift
//  Imanage
//
//  Created by Grace Cindy on 23/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeEmailLabel: UILabel!
    @IBOutlet weak var storePhoneLabel: UILabel!
    @IBOutlet weak var tokpedConnectBtn: UIButton!
    @IBOutlet weak var blConnectBtn: UIButton!
    
    let blueColor = #colorLiteral(red: 0.1882352941, green: 0.2784313725, blue: 0.368627451, alpha: 1)
    let comingSoonColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    var btnState = "notConnected" //[notConnected, connected, coming_soon ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        storeImageView.layer.cornerRadius = storeImageView.frame.width / 2
        storeImageView.clipsToBounds = true
        
        
        APIManager.shareInstance.getProfile()
        {
            (status, errorMsg, data) in
            print("status = \(status), data = \(data)")
            if status
            {
                self.storeNameLabel.text = data["storeName"] as! String
                self.storeEmailLabel.text = data["email"] as! String
                self.storePhoneLabel.text = data["storePhoneNumber"] as! String

                let pin = data["pin"] as? String
                print("ProfileVC, data : \(data)")
                
                if pin == nil || pin == "" || pin == "0000" {
                    print("ProfileVC Pin null")
                    self.setupButton(selectedButton: self.tokpedConnectBtn, state: "notConnected")
                }
                else {
                    print("ProfileVC Pin NOT null")
                    self.setupButton(selectedButton: self.tokpedConnectBtn, state: "connected")
                }
                self.setupButton(selectedButton: self.blConnectBtn, state: "comingSoon")
            }
            
        }
        
    }
    
    
    func setupButton(selectedButton : UIButton, state : String)
    {
        if state == "connected" {
            //connected
            // connect button : textColor, border color = #30475E, background color = white
            //selectedButton.isHidden = true
            
            selectedButton.setTitle("Connected", for: .normal)
            selectedButton.setTitleColor(UIColor.white, for: .normal)
            selectedButton.layer.borderColor = blueColor.cgColor
            selectedButton.layer.backgroundColor = blueColor.cgColor
            selectedButton.isEnabled = false
            
            
        }
        else if state == "notConnected" {
            //disconnected
            // disconnect button : text color = white, fill color = #30475E
            selectedButton.setTitle("Connect", for: .normal)
            selectedButton.setTitleColor(blueColor, for: .normal)
            selectedButton.layer.borderColor = blueColor.cgColor
            selectedButton.layer.backgroundColor = UIColor.white.cgColor
            selectedButton.isEnabled = true
            
        }
        else {
            selectedButton.setTitle("Coming Soon", for: .disabled)
            selectedButton.setTitleColor(comingSoonColor, for: .disabled)
            selectedButton.layer.borderColor = comingSoonColor.cgColor
            selectedButton.layer.backgroundColor = UIColor.white.cgColor
            selectedButton.isEnabled = false
        }
        
    }
    
    @IBAction func actionBtn(_ sender: UIButton) {
        if sender == tokpedConnectBtn
        {
            performSegue(withIdentifier: "loginCommerceSegue", sender: self)
            
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

extension ProfileVC {
    @IBAction func cancelToProfileVC(_ segue : UIStoryboardSegue){
        
    }
}
