//
//  loginUser.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
// ini buat detail loginnya
struct userLogin: Codable
{
    let id: Int
    let nama: String
    let telepon: String
    let email: String
    let password: String
    let alamat : String
    let api_token: String
    let status: String
}

// ini buat dapetin token usernya
struct loginUser : Codable{
    let api_token: String
}

