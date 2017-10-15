//
//  HomeVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var sliderImgView: UIImageView!
    @IBOutlet weak var pageCntrl: UIPageControl!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var sliderImgArray = [TVInfo]()
    var scrollTime : Timer!
    var imgCnt: Int!
    var categoryArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = tableView.frame.size.height / 5
        
        categoryArray = ["Latest", "Airing Today", "On The Air", "Popular", "Top Rated"]
        
        DataService.instance.onTheAirTV(urlString: TV_ON_THE_AIR) { (success) in
            if success {
                let imgArray = DataService.instance.tvInfos[0..<5]
                self.sliderImgArray = Array(imgArray)
                
                self.imgCnt = 0
                
                self.scrollTime = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.updateImage), userInfo: nil, repeats: true)
                
            } else {
                print("Hellooo")
                // error alert
            }
        }
    }
    
    @objc func updateImage() {
        if (imgCnt <= 4) {
            pageCntrl.currentPage = imgCnt
            sliderImgView.loadImageFromUrl(sliderImgArray[imgCnt].wallposterUrl)
            activitySpinner.isHidden = true
            activitySpinner.stopAnimating()
            imgCnt = imgCnt + 1
        } else {
            imgCnt = 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.size.height / 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CATEGORY_CELL_IDENTIFIER, for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row]
        return cell
    }
}
