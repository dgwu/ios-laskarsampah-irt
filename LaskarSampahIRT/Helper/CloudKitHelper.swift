//
//  CloudKitHelper.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 16/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

typealias onFetchRecordSuccess = ([News]) -> Void

class CloudKitHelper {
    
    func fetchNewsRecord(onFetchSuccess: @escaping onFetchRecordSuccess) {
        let container = CKContainer.default()
        let database = container.publicCloudDatabase
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "News", predicate: predicate)
        
        database.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error Fetch: \(error.localizedDescription)")
            } else {
                print("Success Fetch")
                var news = [News]()
                records?.forEach({ (record) in
                    if let story = self.convertRecordToNews(record: record) {
                        news.append(story)
                    }
                })
                
                onFetchSuccess(news)
            }
        }
    }
    
    func convertRecordToNews(record: CKRecord) -> News? {
        guard let id = record["id"] as? Int,
            let judul = record["judul"] as? String,
            let tanggal = record["tanggal"] as? String,
            let content = record["content"] as? String,
            let url = record["url"] as? String
        else {
            return nil
        }
        
        let news = News(id: id, judul: judul, tanggal: tanggal, content: content, url: url)
        return news
    }
}
