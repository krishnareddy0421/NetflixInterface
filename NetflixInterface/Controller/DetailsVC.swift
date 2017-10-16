//
//  DetailsVC.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/15/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var backdropImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!
    @IBOutlet weak var creatorsNamesLbl: UILabel!
    
    var tvInfoDetails: TVInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlForTV = "https://api.themoviedb.org/3/tv/\(tvInfoDetails.id!)?api_key=\(API_KEY)&language=en-US"
        
        DataService.instance.getTVShowDetails(urlString: urlForTV) { (success) in
            if success {
                let creatorNames = DataService.instance.tvShowCreators.joined(separator: ", ")
                self.creatorsNamesLbl.text = "\(creatorNames)"
            } else {
                self.somethingWentWrongAlert()
            }
        }
    
        backdropImgView.loadImageFromUrl(tvInfoDetails.wallposterUrl)
        titleLbl.text = "\(tvInfoDetails.title!)"
        overviewLbl.text = "\(tvInfoDetails.description!)"
    }
    
    @IBAction func playTrailerBtnPressed(_ sender: Any) {
        let trailer = TrailerVC()
        trailer.modalPresentationStyle = .custom
        present(trailer, animated: true, completion: nil)
    }
}
