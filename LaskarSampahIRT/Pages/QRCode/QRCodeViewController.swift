//
//  QRCodeViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 11/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrImageView.image = QRCodeHelper().generateQRCode(from: "Heyho")
        // Do any additional setup after loading the view.
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
