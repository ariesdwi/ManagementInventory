//
//  ProfileVC.swift
//  Imanage
//
//  Created by Grace Cindy on 23/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var tokpedConnectBtn: UIButton!
    @IBOutlet weak var blConnectBtn: UIButton!
    
    let blueColor = #colorLiteral(red: 0.1882352941, green: 0.2784313725, blue: 0.368627451, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        storeImage.layer.cornerRadius = storeImage.frame.width / 2
        storeImage.clipsToBounds = true         
        
        APIManager.shareInstance.getProfile()
        
        setupButton(selectedButton: tokpedConnectBtn, state: false)
        setupButton(selectedButton: blConnectBtn, state: true)
        
    }
    
    
    func setupButton(selectedButton : UIButton, state : Bool)
    {
        if state {
            //connected
            // connect button : textColor, border color = #30475E, background color = white
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}
