//
//  InventoryViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 07/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    @IBOutlet var Navbar: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
    }

    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
    
        Navbar.searchController = searchController
    }
}
