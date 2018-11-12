//
//  GetUser.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 02/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
import UIKit

class GetUser {
  
    var api : String
    init(apitoken: String) {
        self.api = apitoken
    }
}

class UserCredential {
    
    func getUserDefault() -> UserDefaults? {
        return UserDefaults.init(suiteName: "com.danielgunawan.LaskarSampahIRT")
    }
    
    func getTelepon() -> String {
        let userDefault = self.getUserDefault()
        if let telepon = userDefault?.string(forKey: "telepon") {
            print("masuk telepon")
        } else {
            print("gak masuk telepon")
        }
        return userDefault?.string(forKey: "telepon") ?? "082227282872"
    }
}
