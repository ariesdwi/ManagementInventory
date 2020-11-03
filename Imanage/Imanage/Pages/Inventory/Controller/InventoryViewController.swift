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
    
    var listofProduct = [productDetail]() {
        didSet {
            DispatchQueue.main.async {
                self.tabelView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "product", bundle: nil )
        tabelView.register(nib, forCellReuseIdentifier: "product")
        
        tabelView.delegate = self
        tabelView.dataSource = self
        setupNavbar()
        
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       APIManager.shareInstance.getInventoryProduct{ [weak self] result in
           switch result {
           case .failure(let error):
               print(error)
           case .success(let produks):
               self?.listofProduct = produks
           }
       }
        
    }
    
    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
        
        Navbar.searchController = searchController
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "product"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? product else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let produkDetail = listofProduct[indexPath.row]
        let quantity = "\(produkDetail.qty)"
        
        cell.labelProduct.text = produkDetail.name
        cell.priceLabel.text = produkDetail.price
        cell.QuantityLabel.text = quantity
        cell.imageProduct.backgroundColor = .red
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           //Data untuk performSegue activity to ChallengeOverview
           self.performSegue(withIdentifier: "segueToDetailProduct", sender: myData[indexPath.row])

       }
}

    
