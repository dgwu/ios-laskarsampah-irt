//
//  ListBankSampah.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 16/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation


struct ListBankSampah
{
    let id: Int
    let nama: String
    let alamat: String
    let telepon: String
    let longitude: String
    let latitude: String
    let email: String
}

var dummyLocationBank = [
    ListBankSampah(id: 1, nama: "Bank Sampah Bonang Asri", alamat: "Komp. Perumahan Dasana Indah, Jl. Dasana Indah, Bojong Nangka, Klp. Dua, Tangerang, Banten 15810, Indonesia", telepon: "021", longitude: "-6.2543448", latitude: "106.5950428,17z",email: "-"),
    ListBankSampah(id: 2, nama: "Bank Sampah Lius Yulianto", alamat: "Blok UB7 No. 6, Komp. Perumahan Dasana Indah, Jl. Dasana Indah, Bojong Nangka, Klp. Dua, Tangerang, Banten 15810, Indonesia", telepon: "021", longitude: "-6.253119", latitude: "106.5969165,19z",email: "-"),
    ListBankSampah(id: 3, nama: "Bank Sampah SW", alamat: "Jl. Kp. Pager Haur, Pagedangan, Tangerang, Banten 15331, Indonesia", telepon: "021", longitude: "-6.290785", latitude: "106.6403675,19z",email: "-")
]
