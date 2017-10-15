//
//  DataService.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    var tvInfos = [TVInfo]()
    
    func onTheAirTV(urlString: String, completion: @escaping CompletionHandler) {
        let url = URL(string: urlString)
        
        self.tvInfos.removeAll()
        
        Alamofire.request(url!).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                guard let results = json["results"].array else {
                    completion(false)
                    return
                }
                for result in results {
                    let name = result["name"].stringValue
                    let backdropImg = result["backdrop_path"].stringValue
                    let imageUrl = "\(BASE_URL)\(backdropImg)"
                    
                    let tvInfo = TVInfo(title: name, wallposterUrl: imageUrl)
                    self.tvInfos.append(tvInfo)
                }
                completion(true)
            case .failure(let error):
                // Error alert
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
