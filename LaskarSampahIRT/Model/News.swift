//
//  News.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 01/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
// 'id', 'judul', 'tanggal', 'content', 'url', 'like','status','createBy'
struct News: Codable {
    let id: Int
    let judul: String
    let tanggal: String
    let content: String
    let url: String
}

var dummyNewsList = [
    News(id: 1, judul: "halo", tanggal: "2018-10-10", content: "Lorem ipsum :)", url: "https://via.placeholder.com/160x90.png?text=LaskarSampah")
]
