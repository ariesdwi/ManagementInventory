//
//  OrderVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 08/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//
import Foundation
import UIKit

class OrderVC: UIViewController, UISearchBarDelegate , UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate {
   
    @IBOutlet var NavbarOrder: UINavigationItem!
    @IBOutlet var tableView: UITableView!
    
    let orderName = ["Evelyn Allen","Nahia Colunga","Takamaru Ayako","Afonso Pinto","Jordan Kitchener","Aries Dwi"]
    let sku = ["200518JKT220D","200518JKT220B","200519JKT220Y","200519JKT220P","200519JKT220D","200518JKT220B"]
    let date = ["10/2/12","4/3/12","5/12/12","10/11/11","4/14/1","5/4/1"]
    let channal = ["Tokopedia","Bukalapak","Blibli","Shoope","Tokopedia","Bukalapak"]
    let progress = ["On Process","On Process","On Process","On Process","On Process","On Process"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil )
        
        tableView.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
        NavbarOrder.searchController = searchController
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(named: "sort-arrows-couple-pointing-up-and-down"), for: .bookmark, state: .normal)
//        searchController.searchBar.delegate = self
//        searchController.searchBar.showsBookmarkButton = true
//        searchController.searchBar.setImage(UIImage(named: "Sort"), for: .bookmark, state: .normal)
//        
//        if searchController.isActive {
//            searchController.searchBar.showsBookmarkButton = false
//        } else {
//            searchController.searchBar.showsBookmarkButton = true
//        }
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        //showAlert, presentVC or whatever you want here
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        cell.OrderNameLabel.text = orderName[indexPath.row]
        cell.SkuLabel.text = sku[indexPath.row]
        cell.DateLabel.text = date[indexPath.row]
        cell.Channel.text = channal[indexPath.row]
        cell.ProgressLabel.text = progress[indexPath.row]
        
        
        return cell
    }
    
}
    
extension ViewController: UISearchBarDelegate {

   func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
      print("click")
   }

}
