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
    
    @IBOutlet var nextButton: UIButton!
    
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
        
        tableViewCP.register(nib, forCellReuseIdentifier: "ChooseOrderCell")
        tableViewCP.register(nib2, forCellReuseIdentifier: "buttonNextCell")
       
        APIManager.shareInstance.getInventoryProduct{ [weak self] result in
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let produks):
                       self?.listofProduct = produks
                   }
        }
        nextButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 23.0).isActive = true
        
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
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listofProduct.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
