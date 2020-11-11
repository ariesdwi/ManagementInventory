//
//  InventoryViewController.swift
//  Imanage
//
//  Created by Aries Dwi Prasetiyo on 07/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit




class InventoryViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchControllerDelegate, UISearchBarDelegate
{
    
    @IBOutlet var Navbar: UINavigationItem!
    
    @IBOutlet var shapeLowOnStock: UIView!
    @IBOutlet var shapeBestSeller: UIView!
    @IBOutlet var shapeFav: UIView!
    
    @IBOutlet var tabelView: UITableView!
    
    let myData = ["First","Second","Third","First","Second","Third"]
    let price = ["12$","15$","16$","12$","15$","16$"]
    let quantity = ["10","4","5","10","4","5"]
    
    static let shareInstance = InventoryViewController()
    
    let accountID = UserDefaults.standard.integer(forKey: APIManager.shareInstance.accIdKey)
    
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
        
        let refresControl = UIRefreshControl()
        refresControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        self.tabelView.refreshControl = refresControl
         
        shapeLowOnStock.layer.cornerRadius = 10
        shapeLowOnStock.layer.shadowOffset = CGSize(width: 0, height: 8)
        shapeLowOnStock.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shapeLowOnStock.layer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLowOnStock.layer.shadowOpacity = 1.0
        shapeLowOnStock.layer.shadowRadius = 10.0
       
        
        shapeBestSeller.layer.cornerRadius = 10
        shapeBestSeller.layer.shadowOffset = CGSize(width: 0, height: 8)
        shapeBestSeller.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shapeBestSeller.layer.shadowOffset = CGSize(width: 0, height: 3)
        shapeBestSeller.layer.shadowOpacity = 1.0
        shapeBestSeller.layer.shadowRadius = 10.0
        
        
        shapeFav.layer.cornerRadius = 10
        shapeFav.layer.shadowOffset = CGSize(width: 0, height: 8)
        shapeFav.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        shapeFav.layer.shadowOffset = CGSize(width: 0, height: 3)
        shapeFav.layer.shadowOpacity = 1.0
        shapeFav.layer.shadowRadius = 10.0
        
        
    }
    
    @objc func refresh(_ sender: Any){
        APIManager.shareInstance.getInventoryProduct{ [weak self] result in
                 switch result {
                 case .failure(let error):
                     print(error)
                 case .success(let produks):
                     self?.listofProduct = produks
                 }
            }
        DispatchQueue.main.async {
            self.tabelView.refreshControl?.endRefreshing()
        }
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
        
        let price = "\(produkDetail.price)"
        let completeImage = produkDetail.images[0]
        
        cell.labelProduct.text = produkDetail.name
        cell.priceLabel.text = price
        cell.QuantityLabel.text = quantity

        
        cell.imageProduct.downloaded(from: completeImage)
//        cell.imageProduct.backgroundColor = .blue

       //cell.imageProduct.image = UIImage(data:  UserDefaults.standard.object(forKey: "\(produkDetail.name)") as! Data)!
        
        
        //cell.imageProduct.image = UIImage(data:  UserDefaults.standard.object(forKey: "\(produkDetail.name)") as! Data)
        //let dataImage =  UserDefaults.standard.object(forKey: "\(produkDetail.name)")
       // if dataImage != nil {
           // cell.imageProduct.image = UIImage(data:  UserDefaults.standard.object(forKey: "\(produkDetail.name)") as! Data)
       // }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let produkDetail = listofProduct[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "productDetailStory") as! productDetailVC
        vc.nameProduct = produkDetail.name
        vc.priceProduct = produkDetail.price
        vc.qtyProduct = produkDetail.qty
        vc.descProduct = produkDetail.description
        vc.colorProduct = produkDetail.variant ?? ""
        vc.weightProduct = produkDetail.weight
        vc.condition = produkDetail.condition
        vc.id = produkDetail.id
        vc.imgUrl = produkDetail.images[0]
        vc.weightType = produkDetail.weightType
        self.navigationController?.pushViewController(vc, animated: true)
           //Data untuk performSegue activity to ChallengeOverview
//        self.performSegue(withIdentifier: "segueToDetailProduct", sender: listofProduct[indexPath.row])

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         
      
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        let productDetail = listofProduct.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        print("id number \(productDetail.id)")

        APIManager.shareInstance.deleteProduct(productID: productDetail.id)
     }
    }
    
    
    @IBAction func addModalVC(_ sender: Any) {
       
    }
    
    @IBAction func unwindToInventory(_ unwindSegue: UIStoryboardSegue) {
        APIManager.shareInstance.getInventoryProduct{ [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let produks):
                self?.listofProduct = produks
            }
        }
        DispatchQueue.main.async {
            self.tabelView.refreshControl?.endRefreshing()
        }
           // Use data from the view controller which initiated the unwind segue
    }
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

   
}


    

       

