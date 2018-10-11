//
//  ItemPrice.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 10/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
struct ItemPrice {
    let id: Int
    let description: String
    let price: Double
    let priceUnit: String
    let poin: Double
}

var dummyPriceList = [
    ItemPrice(id: 1, description: "Kardus", price: 1300, priceUnit: "Kg", poin: 10),
    ItemPrice(id: 2, description: "Buku/Majalah/Koran", price: 700, priceUnit: "kg", poin: 5),
    ItemPrice(id: 3, description: "Gelas Plastik Bersih", price: 4000, priceUnit: "kg", poin: 35)
]
