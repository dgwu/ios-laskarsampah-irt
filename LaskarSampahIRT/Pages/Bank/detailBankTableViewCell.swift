//
//  detailBankTableViewCell.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class detailBankTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblNamaBank: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var viewJarak: UIView!
   
    @IBOutlet weak var lblJarak: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackground.backgroundColor = #colorLiteral(red: 1, green: 0.9891478419, blue: 0.9185404181, alpha: 1)
        viewBackground.layer.cornerRadius = 15
        
        viewJarak.backgroundColor = #colorLiteral(red: 0.0672223568, green: 0.4756054878, blue: 0.3615720868, alpha: 1)
        viewJarak.layer.cornerRadius = viewJarak.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
