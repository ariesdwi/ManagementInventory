//
//  SettingVC.swift
//  Imanage
//
//  Created by Grace Cindy on 27/10/20.
//  Copyright © 2020 Aries Dwi Prasetiyo. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var settingTableView: UITableView!
    
    // dummy data
    let sectionList = ["Notifications"]
    
    struct notifItems {
        var name : String
        var isOn : Bool
    }
    var sectionNotifItems =
        [
            notifItems(name: "Low On Stock", isOn: false),
            notifItems(name: "New Order", isOn: false)
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSettingData()
        
        // Do any additional setup after loading the view.
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.sectionHeaderHeight = 40
        return sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionNotifItems.count
        }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        //load notification cell
        if indexPath.section == 0
        {
            cell.textLabel?.text = sectionNotifItems[indexPath.row].name
            
            let eachSwitch = UISwitch()
            eachSwitch.isOn = sectionNotifItems[indexPath.row].isOn
            eachSwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
            eachSwitch.tag = indexPath.row
            
            cell.accessoryView = eachSwitch
        }
        
        else
        {
            cell.textLabel?.text = "not yet configured!"
        }
        
        return cell
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch)
    {
        if sender.isOn
        {
            print("Turned ON, index : \(sender.tag)")
        }
        else
        {
            print("Turned OFF, index : \(sender.tag)")
        }
        updateNotifSetting(indexRow: sender.tag, isOn: sender.isOn)
    }
    
    func loadSettingData()
    {
        sectionNotifItems[0].isOn = true
        sectionNotifItems[1].isOn = false
    }
    
    func updateNotifSetting(indexRow : Int, isOn : Bool)
    {
        sectionNotifItems[indexRow].isOn = isOn
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
