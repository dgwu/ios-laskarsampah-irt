//
//  NewsViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 01/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var news: News?
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsTimestampLabel: UILabel!
    @IBOutlet weak var newsContentLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.title = "News"
        
        guard let news = news else {
            return
        }
        self.newsTitleLabel.text = news.judul
        self.newsTimestampLabel.text = news.tanggal
        self.newsContentLabel.text = news.content
        ApiHelper.fetchImage(from: news.url) { (fetchedImage) in
            if let fetchedImage = fetchedImage {
                DispatchQueue.main.async {
                    self.newsImageView.image = fetchedImage
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
