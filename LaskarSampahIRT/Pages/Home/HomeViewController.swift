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
    var newsList = [News]()
    let apiHelper = ApiHelper()
    var selectedNewsIndex: Int?
    
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
        
        self.priceTableView.layer.cornerRadius = 10
        
        self.apiHelper.fetchNewsList { (newsList) in
            if let newsList = newsList {
                self.newsList = newsList
                DispatchQueue.main.async {
                    self.newsAndTipsCollectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsAndTips", for: indexPath) as! NewsAndTipsCollectionViewCell
        let news = self.newsList[indexPath.row]
        
//        cell.newsImageView.image = UIImage(named: "Recycle")
        ApiHelper.fetchImage(from: news.url) { (fetchedImage) in
            if let fetchedImage = fetchedImage {
                DispatchQueue.main.async {
                    cell.newsImageView.image = fetchedImage
                }
            }
        }
        cell.newsLabel.text = news.judul
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select at \(indexPath.row)")
        self.selectedNewsIndex = indexPath.row
        self.performSegue(withIdentifier: "ToNews", sender: nil)
    }
    
    // MARK: Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath)
        let priceItem = priceList[indexPath.row]
        cell.textLabel?.text = priceItem.item_name
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "."
        let formattedPrice = numberFormatter.string(from: NSNumber(value: priceItem.item_price))
        
        cell.detailTextLabel?.text = "Rp \(formattedPrice!)/\(priceItem.item_unit)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsViewController, let selectedNewsIndex = selectedNewsIndex {
            destination.news = self.newsList[selectedNewsIndex]
        }
    }
}
