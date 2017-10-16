//
//  TVCell.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class TVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var posterImgView: UIImageView!
    
    func configureCell(_ tvInfoDetails: TVInfo) {
        posterImgView.loadImageFromUrl(tvInfoDetails.posterUrl)
    }
    
}
