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
    var index : Int!
    
    @IBOutlet weak var tableViewBank: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyLocationBank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailBankTableViewCell
        let bank = dummyLocationBank[indexPath.row]
        
        cell.lblNamaBank?.text = bank.nama
        cell.lblAlamat?.text = bank.alamat
        cell.lblJarak?.text = bank.jarak
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index ke \(indexPath.row) di click")
        index = indexPath.row
        performSegue(withIdentifier: "ShowDetail", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationDetail = segue.destination as? DetailBankSampahViewController
        {
            destinationDetail.titleDetail.title = ""
            destinationDetail.IDData = index
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBank.delegate = self
        tableViewBank.dataSource = self
    }
    
}


