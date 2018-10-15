//
//  BankSampahViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 15/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class BankSampahViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   var keys :[String] = []

    
    @IBOutlet weak var tableViewBank: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailBankTableViewCell
        let bank = dummyLocationBank[indexPath.row]
        
        cell.lblNamaBank?.text = bank.nama
        cell.lblAlamat?.text = bank.alamat
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBank.delegate = self
        tableViewBank.dataSource = self
        
        
    }
    
}


