//
//  ProfileViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    @IBOutlet weak var tableViewHistory: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
           // let bank = dummyLocationBank[indexPath.row]
            cell.lblTanggal.text = "12/10/2018 03:20 PM"
            cell.lblpoin1.text = "80"
            cell.lblpoin2.text = "120"
        cell.totalPoin.text = "200"
            
        return cell
    }
    

    @IBOutlet weak var groupViewProfile: UIView!
    
    @IBOutlet weak var viewHistory: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        groupViewProfile.layer.cornerRadius = 10
        viewHistory.layer.cornerRadius = 10
        
        tableViewHistory.delegate = self
        tableViewHistory.dataSource = self
       
    }
    

    

}
