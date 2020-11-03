//
//  InventoryViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 07/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var Navbar: UINavigationItem!
    
    
    @IBOutlet var tabelView: UITableView!
    
    let myData = ["First","Second","Third","First","Second","Third"]
    let price = ["12$","15$","16$","12$","15$","16$"]
    let quantity = ["10","4","5","10","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "product", bundle: nil )
        tabelView.register(nib, forCellReuseIdentifier: "product")
        
        tabelView.delegate = self
        tabelView.dataSource = self
        setupNavbar()
        APIManager.shareInstance.getInventoryProduct()
    }
    
    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
        
        Navbar.searchController = searchController
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "product"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? product else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        cell.labelProduct.text = myData[indexPath.row]
        cell.priceLabel.text = price[indexPath.row]
        cell.QuantityLabel.text = quantity[indexPath.row]
        cell.imageProduct.backgroundColor = .red
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           //Data untuk performSegue activity to ChallengeOverview
           self.performSegue(withIdentifier: "segueToDetailProduct", sender: myData[indexPath.row])

       }
}

    
