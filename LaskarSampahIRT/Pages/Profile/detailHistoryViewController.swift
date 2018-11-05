//
//  detailHistoryViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class detailHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    let apiHelper = ApiHelper()
    var TransDetail = [TransactionDetail]()
    
    var api_user : String!
    var idTrans : Int!
    @IBOutlet weak var lblJudul: UILabel!
    @IBOutlet weak var Viewbackground: UIView!
    
    
    @IBOutlet weak var tbldetailHistory: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblJudul.text = "Riwayat Transaksi"

        Viewbackground.layer.cornerRadius = 15
        
        tbldetailHistory.delegate = self
        tbldetailHistory.dataSource = self
    
        
        let api_token = UserDefaults.standard.string(forKey: "api_token") ?? ""
        print("ini iptokennya\(api_token)")
        
        self.apiHelper.fetchTransactionDetail(apiToken: api_token, transactionId: idTrans) { (TransactionDetail) in
            if let transaksiDetail = TransactionDetail
            {
                self.TransDetail = transaksiDetail
                DispatchQueue.main.async {
                    self.tbldetailHistory.reloadData()
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! detailHistoriTableViewCell
        
        let transaksi = TransDetail[indexPath.row]
        
        cell.lblNama.text = "\(transaksi.nama_item) (\(transaksi.jumlah) Kg)"
        cell.lbllJumlah.text = "\(transaksi.jumlah) Kg"
        cell.lblPoin.text = "\(transaksi.poin) Poin"
        cell.lblTotal.text = "\(transaksi.totalPoin)"
        
        return cell
        
        
    }
}
