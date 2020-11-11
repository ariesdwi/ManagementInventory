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
                self.storeNameLabel.text = data["storeName"]
                self.storeEmailLabel.text = data["email"]
                self.storePhoneLabel.text = data["storePhoneNumber"]
                
            }
            
        }
        
        setupButton(selectedButton: tokpedConnectBtn, state: false)
        setupButton(selectedButton: blConnectBtn, state: false)
        
    }
    
    
    func setupButton(selectedButton : UIButton, state : Bool)
    {
        if state {
            //connected
            // connect button : textColor, border color = #30475E, background color = white
            //selectedButton.isHidden = true
            
            selectedButton.setTitle("Disconnect", for: .normal)
            selectedButton.setTitleColor(UIColor.white, for: .normal)
            selectedButton.layer.borderColor = blueColor.cgColor
            selectedButton.layer.backgroundColor = blueColor.cgColor
            
            
        }
        else {
            //disconnected
            // disconnect button : text color = white, fill color = #30475E
            selectedButton.setTitle("Connect", for: .normal)
            selectedButton.setTitleColor(blueColor, for: .normal)
            selectedButton.layer.borderColor = blueColor.cgColor
            selectedButton.layer.backgroundColor = UIColor.white.cgColor
        }
        
    }
    
    @IBAction func actionBtn(_ sender: UIButton) {
        if sender == tokpedConnectBtn
        {
            performSegue(withIdentifier: "loginCommerceSegue", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginCommerceSegue"
        {
            guard let vc = segue.destination as? LoginEcommerceVC else { return }            
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
