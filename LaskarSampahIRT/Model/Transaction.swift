//
//  Transaction.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
struct Transaction: Codable {
    let idTransaksi: Int
    let tanggal: String
    let grandTotal: Double
    let namaBank: String
}
