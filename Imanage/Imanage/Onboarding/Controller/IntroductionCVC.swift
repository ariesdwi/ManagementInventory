//
//  IntroductionCVC.swift
//  Imanage
//
//  Created by Grace Cindy on 09/11/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "introCell"

//

class IntroductionCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageBg: UIImageView!
    
    
    let introImageList = ["intro_1", "intro_2", "intro_3", "intro_4"]
    let introTitleList = ["E-Commerce Manager", "Connect to E-Commerce", "Synchronize Inventory", "Manage Orders"]
    let introBodyList  = [
        "We dedicate this app to help small businesses automate their inventory and order system. See how it works!",
        "Connect to your E-commerce store to  integrate all products and orders. Connect once and manage from here.",
        "Update and manage all of your inventory from multiple E-commerce with one single app. Real time update to your online store.",
        "Keep track of all customer orders from your E-commerce. Manage order easily, avoid the hassle!"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(UINib(nibName: "IntroCell", bundle: nil), forCellWithReuseIdentifier : reuseIdentifier)
        
        collectionView?.isPagingEnabled = true
        
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return introImageList.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IntroCell
    
        // Configure the cell
        cell.introImage?.image = UIImage(named: self.introImageList[indexPath.item])
        cell.introTitle?.text = self.introTitleList[indexPath.item]
        cell.introDesc?.text = self.introBodyList[indexPath.item]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let deviceWidth = view.frame.width
        let deviceHeight = view.frame.height
        //get device weight & height
        // kalkulasiin sesuai padding yang dibutuhkan
        //bikin space untuk top & bottom buat cell nya
        let frameHeight = 0.6 * deviceHeight
        
        return CGSize(width: deviceWidth, height: frameHeight)
    }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = currentPage
        
        if currentPage == introImageList.count - 1 { getStartedBtn.isHidden = false
        }
        else { getStartedBtn.isHidden = true }
        
    }
        
    @IBAction func actionButton(_ sender: UIButton) {
        //prepare segue
        performSegue(withIdentifier: "goToLoginSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLoginSegue"
        {
            guard let vc = segue.destination as? LoginVC else { return }
            
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
