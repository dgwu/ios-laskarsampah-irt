//
//  HistoryTableViewCell.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblpoin1: UILabel!
    @IBOutlet weak var lblpoin2: UILabel!
    
    @IBOutlet weak var imgPoin1: UIImageView!
    @IBOutlet weak var imgPoin2: UIImageView!
    @IBOutlet weak var totalPoin: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
        
        lblTanggal.text = myStringafd
        lblpoin1.text = "80"
        lblpoin2.text = "120"
        
        totalPoin.text = "120"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
