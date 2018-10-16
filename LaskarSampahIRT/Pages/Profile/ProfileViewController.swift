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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        groupViewProfile.layer.cornerRadius = 10
        viewHistory.layer.cornerRadius = 10
        
        tableViewHistory.delegate = self
        tableViewHistory.dataSource = self
        setupView()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        // let bank = dummyLocationBank[indexPath.row]
        cell.lblTanggal.text = "12/10/2018 03:20 PM"
        cell.lblpoin1.text = "80"
        cell.lblpoin2.text = "120"
        cell.totalPoin.text = "200"
        
        return cell
    }

}
