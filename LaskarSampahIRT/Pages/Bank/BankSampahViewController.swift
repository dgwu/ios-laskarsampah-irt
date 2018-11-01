//
//  BankSampahViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 15/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit
import CoreLocation
class BankSampahViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   var keys :[String] = []
    var index : Int!
    
    @IBOutlet weak var tableViewBank: UITableView!
    
    
    var bankList = [ListBankSampah]()
    let apiHelper = ApiHelper()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dummyLocationBank.count
        return bankList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailBankTableViewCell
        
//        let bank = dummyLocationBank[indexPath.row]
//        cell.lblNamaBank?.text = bank.nama
//        cell.lblAlamat?.text = bank.alamat
//        cell.lblJarak?.text = bank.jarak
        
        let listBank = bankList[indexPath.row]
        cell.lblNamaBank?.text = listBank.namaBank
        cell.lblAlamat?.text = listBank.alamat
        //cell.lblJarak?.text =  "\(listBank.distance)"
        let jarak = String(format:"%.1f",listBank.distance) + "Km"
                cell.lblJarak?.text = jarak
        
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
            destinationDetail.bankSampah = bankList[index]
           
        }
    }
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        
        self.tableViewBank.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBank.delegate = self
        tableViewBank.dataSource = self
        
        tableViewBank.layer.cornerRadius = 10
        
        
        
        
        
        
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            currentLocation = locManager.location
        }
        let currLatitude = currentLocation.coordinate.latitude
        let currLongitude = currentLocation.coordinate.longitude
       
        self.apiHelper.fetchBankList(longitude: currentLocation.coordinate.longitude, latitude: currentLocation.coordinate.latitude)
        { (ListBankSampah) in
            if let BankList = ListBankSampah
            {
                self.bankList = BankList
                DispatchQueue.main.async
                {
                    self.tableViewBank.reloadData()
                }
        }
        }
        
    }
    
}


