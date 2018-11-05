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
    
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblTelepon: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPoin: UILabel!
    
    var userLoginData: userLogin?
    
    
    var totalPoinUser : Double = 0
    
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
        getUserDetail()
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
    
    func getUserDetail()
    {
        
        let api_token = UserDefaults.standard.string(forKey: "api_token") ?? ""
        self.apiHelper.fetchUserProfile(apiToken: api_token) { (userLogin) in
            if let userLogins = userLogin
            {
                print(userLogins)
                self.userLoginData = userLogins
                DispatchQueue.main.async
                {
                    self.lblNama.text = self.userLoginData?.nama
                    self.lblTelepon.text = self.userLoginData?.telepon
                    self.lblEmail.text = self.userLoginData?.email
                    self.lblPoin.text = "\(self.totalPoinUser)"
                }
            }
        }
        
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
        self.totalPoinUser += transaksi.grandTotal
        cell.totalPoin.text = "\(transaksi.grandTotal)"
        
        

        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index ke \(indexPath.row) di click")
        index = indexPath.row + 1
        performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationalDetailHistory = segue.destination as? detailHistoryViewController
        {
            destinationalDetailHistory.api_user = UserDefaults.standard.string(forKey: "api_token") ?? ""
            destinationalDetailHistory.idTrans = index
            
        }
    }

}
