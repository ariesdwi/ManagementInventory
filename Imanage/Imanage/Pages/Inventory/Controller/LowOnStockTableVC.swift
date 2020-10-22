//
//  LowOnStockTableVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 22/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class LowOnStockTableVC: UITableViewController {

    @IBOutlet var Navbar: UINavigationItem!
       
       let myData = ["First","Second","Third","First","Second","Third"]
       let price = ["12$","15$","16$","12$","15$","16$"]
       let quantity = ["10","4","5","10","4","5"]
       
       let data = [["0,0", "0,1", "0,2"], ["1,0", "1,1", "1,2"]]
       
       @IBOutlet var TableViewProduct: UITableView!
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           let searchController = UISearchController(searchResultsController: nil)
           
           Navbar.searchController = searchController
           let nib = UINib(nibName: "product", bundle: nil )
           TableViewProduct.register(nib, forCellReuseIdentifier: "product")
           
           
           
           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false
           
           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
       }
       
       // MARK: - Table view data source
       //
       //    override func numberOfSections(in tableView: UITableView) -> Int {
       //        return 2
       //    }
       //
       //
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return myData.count
       }
       
       ////
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
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

}
