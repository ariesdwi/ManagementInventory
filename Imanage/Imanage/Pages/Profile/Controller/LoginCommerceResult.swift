//
//  LoginCommerceResult.swift
//  Imanage
//
//  Created by Grace Cindy on 11/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class LoginCommerceResult: UIViewController {
    
    var resultStatus = Bool()
    
    @IBOutlet weak var resultIV: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadResult()
    }
    

    func loadResult(){
        print("LoginCommerceResult = \(resultStatus)")
        if resultStatus {
            resultIV.image = UIImage(named:"verified")
            resultText.text = "Your account is already connected to your online store. You can synchronize your inventory and order list"
        }
        else {
            resultIV.image = UIImage(named:"failed")
            resultText.text = "Authorization failed. Please try again and complete the process "
        }
    }
    
    @IBAction func actionGoToProfile(_ sender: UIButton) {
        performSegue(withIdentifier: "goToProfileSegue", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfileSegue"
        {
            guard let vc = segue.destination as? ProfileVC else { return }
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
