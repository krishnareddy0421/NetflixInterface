//
//  TrailerVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class TrailerVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var bgView: UIView!
    
//    var trailerId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let trailerUrl = "https://www.youtube.com/watch?v=\(trailerId)"
//        print(trailerUrl)
        self.setUpView()
    }

    func setUpView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        bgView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
