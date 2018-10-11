//
//  HomeViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 10/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var newsAndTipsCollectionView: UICollectionView!
    @IBOutlet weak var priceTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup() {
        newsAndTipsCollectionView.delegate = self
        newsAndTipsCollectionView.dataSource = self
        priceTableView.delegate = self
        priceTableView.dataSource = self
    }
    
    // MARK: Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsAndTips", for: indexPath) as! NewsAndTipsCollectionViewCell
        
        cell.newsImageView.image = UIImage(named: "sample_img")
        cell.newsLabel.text = "Test \(indexPath.row)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select at \(indexPath.row)")
    }
    
    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyPriceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath)
        let priceItem = dummyPriceList[indexPath.row]
        cell.textLabel?.text = priceItem.description
        cell.detailTextLabel?.text = "Rp \(priceItem.price)/\(priceItem.priceUnit)"
        
        return cell
    }
}
