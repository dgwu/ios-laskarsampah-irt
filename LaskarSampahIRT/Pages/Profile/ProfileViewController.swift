//
//  ProfileViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableViewHistory: UITableView!
    @IBOutlet weak var groupViewProfile: UIView!
    @IBOutlet weak var viewHistory: UIView!
    
    @IBOutlet weak var imgRateing: UIImageView!
    
    var TransaksiList = [Transaction]()
    let apiHelper = ApiHelper()
    var index : Int!

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        groupViewProfile.layer.cornerRadius = 10
        viewHistory.layer.cornerRadius = 10
        
        imgRateing.layer.cornerRadius = imgRateing.frame.width / 2
        imgRateing.layer.borderWidth = 5
        imgRateing.layer.borderColor = #colorLiteral(red: 0.8214223385, green: 0.81848979, blue: 0.1368253231, alpha: 1)
        
        tableViewHistory.delegate = self
        tableViewHistory.dataSource = self
        setupView()
        
        let api_token = UserDefaults.standard.string(forKey: "api_token") ?? ""
        print("ini iptokennya\(api_token)")
        self.apiHelper.fetchTransactionList(apiToken: api_token) { (TransaksiList) in
            if let transaksiList = TransaksiList
            {
                self.TransaksiList = transaksiList
                DispatchQueue.main.async
                    {
                        self.tableViewHistory.reloadData()
                }
            }
        }
        
    }
    
    func getUserDetail(apiUser : String)
    {
        
        
//        self.apiHelper.fe(longitude: currentLocation.coordinate.longitude, latitude: currentLocation.coordinate.latitude)
//        { (ListBankSampah) in
//            if let BankList = ListBankSampah
//            {
//                self.bankList = BankList
//                DispatchQueue.main.async
//                    {
//                        self.tableViewBank.reloadData()
//                }
//            }
//        }
        
        
    }
    
    func setupView() {
        addQrButton()
        self.navigationItem.title = "Profile"
    }
    
    func addQrButton() {
        let qrButton = UIBarButtonItem(title: "QR", style: .plain, target: self, action: #selector(navigateToQr))
        self.navigationItem.rightBarButtonItems = [qrButton]
    }
    
    @objc func navigateToQr() {
        let qrCodeStoryboard = UIStoryboard(name: "QRCodeStoryboard", bundle: nil)
        let qrCodeVC = qrCodeStoryboard.instantiateInitialViewController()
        self.navigationController?.pushViewController(qrCodeVC!, animated: true)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransaksiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        let transaksi = TransaksiList[indexPath.row]
        
        cell.lblTanggal.text = transaksi.tanggal
        cell.lblpoin1.text = transaksi.namaBank
        cell.lblpoin2.text = ""
        cell.totalPoin.text = "\(transaksi.grandTotal)"

        
        
        return cell
        
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
//        // let bank = dummyLocationBank[indexPath.row]
//        cell.lblTanggal.text = "12/10/2018 03:20 PM"
//        cell.lblpoin1.text = "80"
//        cell.lblpoin2.text = "120"
//        cell.totalPoin.text = "200"
//
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index ke \(indexPath.row) di click")
        index = indexPath.row
        performSegue(withIdentifier: "ShowDetail", sender: nil)
        
    }

}
