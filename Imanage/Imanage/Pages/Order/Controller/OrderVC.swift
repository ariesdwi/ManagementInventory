//
//  OrderVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 08/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//
import Foundation
import UIKit

class OrderVC: UIViewController, UISearchBarDelegate {

   
    @IBOutlet var NavbarOrder: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        

    }

    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
        NavbarOrder.searchController = searchController
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
    
    
}
