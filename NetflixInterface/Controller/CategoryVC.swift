//
//  CategoryVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        
        if (self.title == "Airing Today") {
            self.networkCallByUrl(AIRING_TODAY_URL)
        } else if (self.title == "On The Air") {
            self.networkCallByUrl(ON_THE_AIR_URL)
        } else if (self.title == "Popular") {
            self.networkCallByUrl(POPULAR_URL)
        } else if (self.title == "Top Rated"){
            self.networkCallByUrl(TOP_RATED_URL)
        }
    }
    
    func networkCallByUrl(_ url: String) {
        DataService.instance.getTVInfo(urlString: url, completion: { (success) in
            if success {
                self.handleSpinnerAnimation()
                self.collectionView.reloadData()
            } else {
                self.handleSpinnerAnimation()
                self.somethingWentWrongAlert()
            }
        })
    }
    
    func handleSpinnerAnimation() {
        activitySpinner.isHidden = true
        activitySpinner.stopAnimating()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfColumns : CGFloat = 3
        
        let spaceBetweenCells : CGFloat = 7
        let padding : CGFloat = 7
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.tvInfos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TV_CELL_IDENTIFIER, for: indexPath) as? TVCell {
        
            let tvInfo = DataService.instance.tvInfos[indexPath.row]
            cell.configureCell(tvInfo)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_DETAILS_SEGUE {
            if let indexPath = self.collectionView?.indexPath(for: sender as! TVCell) {
                let detailVC = segue.destination as! DetailsVC
                let tvInfo = DataService.instance.tvInfos[indexPath.row]
                detailVC.tvInfoDetails = tvInfo
            }
        }
    }
}
