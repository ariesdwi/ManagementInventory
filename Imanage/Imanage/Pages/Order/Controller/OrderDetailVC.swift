//
//  OrderDetailVC.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 26/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class OrderDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet var DetailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "OrderBuyerInformationCell", bundle: nil )
               
        DetailTableView.register(nib, forCellReuseIdentifier: "OrderBuyerInformationCell")
        
        DetailTableView.dataSource = self
        DetailTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderBuyerInformationCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderBuyerInformationCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        return cell
    }
    

}
