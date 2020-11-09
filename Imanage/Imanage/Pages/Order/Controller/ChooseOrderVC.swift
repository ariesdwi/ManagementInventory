//
//  ChooseOrderVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class ChooseOrderVC: UITableViewController {

    @IBOutlet var Navbar: UINavigationItem!
    @IBOutlet var tableViewCP: UITableView!
    let myData = ["First","Second","Third"]
    let price = ["12$","15$","16$","12$","15$","16$"]
    
   
    
    var listofProduct = [productDetail]() {
           didSet {
               DispatchQueue.main.async {
                   self.tableViewCP.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        Navbar.searchController = searchController

        let nib = UINib(nibName: "ChooseOrderCell", bundle: nil )
        let nib2 = UINib(nibName: "buttonNextCell", bundle: nil )
        let nib3 = UINib(nibName: "EmptyCell", bundle: nil )
        
        tableViewCP.register(nib, forCellReuseIdentifier: "ChooseOrderCell")
        tableViewCP.register(nib2, forCellReuseIdentifier: "buttonNextCell")
        tableViewCP.register(nib3, forCellReuseIdentifier: "EmptyCell")
       
        APIManager.shareInstance.getInventoryProduct{ [weak self] result in
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let produks):
                       self?.listofProduct = produks
                   }
        }
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           APIManager.shareInstance.getInventoryProduct{ [weak self] result in
               switch result {
               case .failure(let error):
                   print(error)
               case .success(let produks):
                   self?.listofProduct = produks
               }
           }
       }
    
    @IBAction func backToOrder(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listofProduct.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableViewCP.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        if indexPath.section == 0 {
            let cellIdentifier = "ChooseOrderCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChooseOrderCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            let produkDetail = listofProduct[indexPath.row]
            let quantity = "\(produkDetail.qty)"
            
            let price = "\(produkDetail.price)"
            
            cell.productNameLabel.text = produkDetail.name
            cell.priceLabel.text = price
            cell.productImageView.backgroundColor = .red
            return cell
        }
        
        if indexPath.section == 1 && indexPath.row == 0   {
            let cellIdentifier = "buttonNextCell"
            guard let cell = tableViewCP.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? buttonNextCell else {
                fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
            
            cell.delegateChooseOrder = self
            
            return cell
        }
        
        
        return cell
    }
    

}

extension ChooseOrderVC: buttonNextCellDelegate {
    func chooseOrder() {
        performSegue(withIdentifier: "segueOrderBuyer", sender: (Any).self)
    }
}
