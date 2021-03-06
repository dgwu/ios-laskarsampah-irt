//
//  ApiHelper.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 26/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
import UIKit

class ApiHelper {
    let baseURL = "http://laskarsampah.danielgunawan.com"
    
    func requestAndCheckIsValid(apiPath: String, completion: @escaping([String:Any]?) -> Void) {
        let requestUrl = URL(string: "\(self.baseURL)/\(apiPath)")!
        
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            if let data = data {
                do {
                    if let responseDictionary =  try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let errorCode = responseDictionary["errorCode"] as? Int, errorCode == 200 {
                            completion(responseDictionary)
                            return
                        }
                    }
                } catch {
                    print("Error on requestAndCheckIsValid: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
        task.resume()
    }
    
    func requestAndCheckIsValidWithQueries(apiPath: String, queries: [String:String]?, completion: @escaping([String:Any]?) -> Void) {
        let baseURL = URL(string: "\(self.baseURL)/\(apiPath)")!
        var requestUrl = baseURL
        
        if let queries = queries, queries.count > 0 {
            requestUrl = baseURL.withQueries(queries)!
        }
        
        let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
            if let data = data {
                do {
                    if let responseDictionary =  try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let errorCode = responseDictionary["errorCode"] as? Int, errorCode == 200 {
                            completion(responseDictionary)
                            return
                        }
                    }
                } catch {
                    print("Error on requestAndCheckIsValid: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
        task.resume()
    }
    
    func postAndCheckIsValid(apiPath: String, parameters: [String: Any], completion: @escaping([String:Any]?) -> Void) {
        let requestURL = URL(string: "\(self.baseURL)/\(apiPath)")!
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.sortedKeys)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    if let responseDictionary =  try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let errorCode = responseDictionary["errorCode"] as? Int, errorCode == 200 {
                            completion(responseDictionary)
                            return
                        }
                    }
                } catch {
                    print("Error on postAndCheckIsValid: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
        task.resume()
    }
    
    func fetchPriceList(completion: @escaping([ItemPrice]?) -> Void) {
        let apiPath = "pricelist"
        requestAndCheckIsValid(apiPath: apiPath) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let priceList = result["price_list"] as? [[String : Any]] {
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: priceList, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                            // decode the JsonDataObject into desired object using Decodable
                            let priceListStructs = try JSONDecoder().decode([ItemPrice].self, from: jsonData)
                            completion(priceListStructs)
                            return
                        } else {
                            print("gagal translate price list")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchPriceList: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }

     func fetchNewsList(completion: @escaping([News]?) -> Void) {
        let apiPath = "getNews"
        postAndCheckIsValid(apiPath: apiPath, parameters: [:]) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let newsList = result["news"] as? [[String : Any]] {
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: newsList, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                            // decode the JsonDataObject into desired object using Decodable
                            let newsListStructs = try JSONDecoder().decode([News].self, from: jsonData)
                            completion(newsListStructs)
                            return
                        } else {
                            print("gagal translate news list")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchNewsList: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
    func fetchBankList(longitude : Double , latitude: Double, completion: @escaping([ListBankSampah]?) -> Void)
    {
        let apiPath = "getWasteBank"
        let parameters = [
            "latitude" : latitude,
            "longitude": longitude
        ]
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        print("resultnya Cetak : \(result)")
                        if let wasteBank = result["bank"] as? [[String : Any]] {
                        
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: wasteBank, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                                print("datanya ::::::::: \(jsonData)")
                            
                            
                            print(wasteBank)
                            let listBankStructs = try JSONDecoder().decode([ListBankSampah].self, from: jsonData)
                            
                            completion(listBankStructs)
                            return
                        } else {
                            print("gagal translate list Bank")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchPriceList: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
  
    func fetchBankListBy(ID : Int, longitude : Double , latitude: Double, completion: @escaping([ListBankSampah]?) -> Void)
    {
        let apiPath = "getWasteBank"
        let parameters = [
            "latitude" : latitude,
            "longitude": longitude
        ]
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let wasteBank = result["bank"] as? [[String : Any]] {
                            
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: wasteBank, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                            print("datanya ::::::::: \(jsonData)")
                            
                            print(wasteBank)
                            let listBankStructs = try JSONDecoder().decode([ListBankSampah].self, from: jsonData)
                            
                            completion(listBankStructs)
                            return
                        } else {
                            print("gagal translate price list")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchPriceList: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
    /*
     Fungsi untuk register user
     akan return api_token dalam completion jika berhasil
     akan return nil dalam completion jika gagal
     */
    func registerUser(nama: String, email: String?, telepon: String, password: String, completion: @escaping(String?) -> Void) {
        let apiPath = "register"
        let parameters = [
            "nama" : nama,
            "telepon" : telepon,
            "password" : password,
            "email" : email ?? ""
        ]
        
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                if let result = responseDictionary["result"] as? [String : Any] {
                    if let apiToken = result["api_token"] as? String {
                        completion(apiToken)
                        return
                    } else {
                        print("gagal translate api token")
                    }
                } else {
                    print("gagal translate result")
                }
            }
            completion(nil)
        }
    }
    
    /*
     Fungsi untuk mendapatkan list transaksi
     */
    func fetchTransactionList(apiToken: String, completion: @escaping([Transaction]?) -> Void) {
        let apiPath = "gettransactions"
        let parameters = [
            "api_token" : apiToken
        ]
        
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let transactions = result["transactions"] as? [[String : Any]] {
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: transactions, options: JSONSerialization.WritingOptions.sortedKeys)
                
                            let transactionStructs = try JSONDecoder().decode([Transaction].self, from: jsonData)
                            
                            completion(transactionStructs)
                            return
                        } else {
                            print("gagal translate transaction list")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchTransactionList: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
    /*
     Fungsi untuk mendapatkan detail transaksi
     */
    func fetchTransactionDetail(apiToken: String, transactionId: Int, completion: @escaping([TransactionDetail]?) -> Void) {
        let apiPath = "gettransactiondetail"
        let parameters: [String:Any] = [
            "api_token" : apiToken,
            "transaction_id" : transactionId
        ]
        
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let details = result["transaction_detail"] as? [[String : Any]] {
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: details, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                            let detailStructs = try JSONDecoder().decode([TransactionDetail].self, from: jsonData)
                            
                            completion(detailStructs)
                            return
                        } else {
                            print("gagal translate detail list")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchTransactionDetail: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
    /*
     Fungsi utk get user profile
     */
    func fetchUserProfile(apiToken: String, completion: @escaping(userLogin?) -> Void) {
        let apiPath = "getuserprofile"
        let parameters = [
            "api_token" : apiToken
        ]
        
        postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary {
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                        if let profile = result["user"] as? [String : Any] {
                            // turn dictionary into data JsonDataObject
                            let jsonData = try JSONSerialization.data(withJSONObject: profile, options: JSONSerialization.WritingOptions.sortedKeys)
                            
                            let profileStruct = try JSONDecoder().decode(userLogin.self, from: jsonData)
                            
                            completion(profileStruct)
                            return
                        } else {
                            print("gagal translate user profile")
                        }
                    } else {
                        print("gagal translate result")
                    }
                } catch {
                    print("Error on fetchUserProfile: \(error.localizedDescription)")
                }
            }
            completion(nil)
        }
    }
    
    /*
     Function to lazy load image from URL and return UIImage on completion
     */
    static func fetchImage(from urlString: String, completion: @escaping(UIImage?) -> Void) {
        let imageUrl = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let data = data,
                let fetchedImage = UIImage(data: data) {
                completion(fetchedImage)
                return
            }
            // default image
            completion(UIImage(named: "Recycle"))
        }
        task.resume()
    }
}
