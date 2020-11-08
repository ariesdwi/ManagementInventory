//
//  IntroductionVCViewController.swift
//  Imanage
//
//  Created by Grace Cindy on 08/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {

    @IBOutlet var skipBtn: UIButton!
    @IBOutlet var introImage: UIImageView!
    @IBOutlet var introTitle: UILabel!
    @IBOutlet var introBody: UILabel!
    @IBOutlet var btnGetStarted: UIButton!
    
    let introImageList = ["intro_1"]
    let introTitleList = ["E-Commerce Manager", "Connect to E-Commerce", "Synchronize Inventory", "Manage Orders"]
    let introBodyList  = [
        "We dedicate this app to help small businesses automate their inventory and order system. See how it works!",
        "Connect to your E-commerce store to  integrate all products and orders. Connect once and manage from here.",
        "Update and manage all of your inventory from multiple E-commerce with one single app. Real time update to your online store.",
        "Keep track of all customer orders from your E-commerce. Manage order easily, avoid the hassle!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
