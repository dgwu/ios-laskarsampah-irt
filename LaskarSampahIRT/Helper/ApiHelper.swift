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
    let baseURL = "http://localhost:8080"
    
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
    
}
