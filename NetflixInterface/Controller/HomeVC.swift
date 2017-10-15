//
//  HomeVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var sliderImgView: UIImageView!
    @IBOutlet weak var pageCntrl: UIPageControl!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var sliderImgArray = [TVInfo]()
    var scrollTime : Timer!
    var imgCnt: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
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
    
    internal func updateImage() {
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
}
