//
//  ImageViewExt.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFromUrl(_ urlString: String) {
        let url = URL(string: urlString)
        do {
            let data = try Data(contentsOf: url!)
            self.image = UIImage(data: data)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
