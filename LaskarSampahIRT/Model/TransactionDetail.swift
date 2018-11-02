//
//  TransactionDetail.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
struct TransactionDetail: Codable {
    let nama_item: String
    let jumlah: Int
    let poin: Int
    let totalPoin: Int
}
