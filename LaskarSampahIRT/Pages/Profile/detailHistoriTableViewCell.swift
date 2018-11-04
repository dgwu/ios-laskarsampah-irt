//
//  detailHistoriTableViewCell.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class detailHistoriTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lbllJumlah: UILabel!
    @IBOutlet weak var lblPoin: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
