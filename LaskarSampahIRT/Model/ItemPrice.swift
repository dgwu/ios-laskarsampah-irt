//
//  ItemPrice.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 10/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
struct ItemPrice: Codable {
    let id: Int
    let item_name: String
    let item_price: Int
    let item_unit: String
    let item_poin: Int
}

var dummyPriceList = [
    ItemPrice(id: 1, item_name: "Kardus", item_price: 1300, item_unit: "Kg", item_poin: 10),
    ItemPrice(id: 2, item_name: "Buku/Majalah/Koran", item_price: 700, item_unit: "kg", item_poin: 5),
    ItemPrice(id: 3, item_name: "Gelas Plastik Bersih", item_price: 4000, item_unit: "kg", item_poin: 35)
]
