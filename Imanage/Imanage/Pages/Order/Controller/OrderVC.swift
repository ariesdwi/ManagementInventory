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
    
    var listofOrder = [modelOrder]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        let nib = UINib(nibName: "OrderTableViewCell", bundle: nil )
        
        tableView.register(nib, forCellReuseIdentifier: "OrderTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let refresControl = UIRefreshControl()
        refresControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
              
        self.tableView.refreshControl = refresControl
      
        APIManager.shareInstance.getOrder{ [weak self] result in
           switch result {
           case .failure(let error):
               print(error)
           case .success(let order):
               self?.listofOrder = order
           }
       }
        

    }
    
    @objc func refresh(_ sender: Any){
        APIManager.shareInstance.getOrder{ [weak self] result in
                     switch result {
                     case .failure(let error):
                         print(error)
                     case .success(let order):
                         self?.listofOrder = order
                     }
                 }
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
       }

    func setupNavbar(){
        let searchController = UISearchController(searchResultsController: nil)
        NavbarOrder.searchController = searchController
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(named: "sort"), for: .bookmark, state: .normal)
     
//        if searchController.isActive {
//            searchController.searchBar.showsBookmarkButton = false
//        } else {
//            searchController.searchBar.showsBookmarkButton = true
//        }
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        //showAlert, presentVC or whatever you want here
        
        let alertController = UIAlertController(title: "Sort By", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Order Date", style: .default, handler: self.okHandler))
         alertController.addAction(UIAlertAction(title: "Channel", style: .default, handler: self.okHandler))
         alertController.addAction(UIAlertAction(title: "Name", style: .default, handler: self.okHandler))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func okHandler(alert: UIAlertAction){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OrderTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let orderDetail = listofOrder[indexPath.row]
        
        cell.OrderNameLabel.text = orderDetail.customerName
        cell.SkuLabel.text = orderDetail.invoiceId
        cell.DateLabel.text = orderDetail.orderDate
        cell.Channel.text = orderDetail.channelName
        cell.ProgressLabel.text = progress[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //Data untuk performSegue activity to ChallengeOverview
        let orderDetail = listofOrder[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "orderDetailStory") as! OrderDetailVC
        
        vc.invoiceId = orderDetail.invoiceId ?? ""
        vc.orderDate = orderDetail.orderDate
        vc.customerName = orderDetail.customerName
        vc.shippingName = "JNE REG"
        vc.shippingTrackingNo = orderDetail.shippingTrackingNo
        vc.customerPhone = orderDetail.customerPhone
        vc.customerEmail = orderDetail.customerEmail
        vc.customerAddress = orderDetail.customerAddress
        vc.channelNotes = orderDetail.channelNotes ?? ""
        vc.additionalNotes = orderDetail.additionalNotes ?? ""
        vc.shippingFee = orderDetail.shippingFee
        vc.statusShip = "Shipped"
        vc.totalPrice = orderDetail.totalPrice
        vc.id = orderDetail.id
        vc.productId = orderDetail.productId
        vc.productsId = orderDetail.productsId
        vc.accountId = orderDetail.accountId
        
           self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        let orderDetail = listofOrder.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        print("id number \(orderDetail.id)")

        APIManager.shareInstance.deleteOrder(orderID: orderDetail.id)
     }
    }
    
  @IBAction func unwindToOrder(_ unwindSegue: UIStoryboardSegue) { }
}
    
extension ViewController: UISearchBarDelegate {

   func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
      print("click")
   }

}
