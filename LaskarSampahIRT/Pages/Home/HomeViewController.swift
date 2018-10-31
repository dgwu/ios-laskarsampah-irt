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
    
    var priceList = [ItemPrice]()
    let apiHelper = ApiHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        //self.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "noun_Home_1994343"), tag: 0)
        // Do any additional setup after loading the view.
    }
    
    func initialSetup() {
        newsAndTipsCollectionView.delegate = self
        newsAndTipsCollectionView.dataSource = self
        priceTableView.delegate = self
        priceTableView.dataSource = self
        
        self.apiHelper.fetchPriceList { (priceList) in
            if let priceList = priceList {
                self.priceList = priceList
                DispatchQueue.main.async {
                    self.priceTableView.reloadData()
                }
            }
        }
        
       
    }
    
    // MARK: Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsAndTips", for: indexPath) as! NewsAndTipsCollectionViewCell
        
        cell.newsImageView.image = UIImage(named: "Recycle")
        cell.newsLabel.text = "News \(indexPath.row + 1)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select at \(indexPath.row)")
    }
    
    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath)
        let priceItem = priceList[indexPath.row]
        cell.textLabel?.text = priceItem.item_name
        cell.detailTextLabel?.text = "Rp \(priceItem.item_price)/\(priceItem.item_unit)"
        
        return cell
    }
}
