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
    var tvShowCreators = [String]()

    func getTVInfo(urlString: String, completion: @escaping CompletionHandler) {
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
                    let showId = result["id"].double
                    let name = result["name"].stringValue
                    let vote = result["vote_average"].double
                    let overview = result["overview"].stringValue
                    let posterImg = result["poster_path"].stringValue
                    let posterUrl = "\(BASE_URL)\(posterImg)"
                    let backdropImg = result["backdrop_path"].stringValue
                    let backdropUrl = "\(BASE_URL)\(backdropImg)"
                    
                    let tvInfo = TVInfo(id: showId, title: name, voteAverage: vote, description: overview, posterUrl: posterUrl, wallposterUrl: backdropUrl)
                    self.tvInfos.append(tvInfo)
                }
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func getTVShowDetails(urlString: String, completion: @escaping CompletionHandler) {
        let url = URL(string: urlString)
        self.tvShowCreators.removeAll()
        Alamofire.request(url!).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                guard let createdBy = json["created_by"].array else {
                    completion(false)
                    return
                }
                for eachCreator in createdBy {
                    let name = eachCreator["name"].stringValue
                    self.tvShowCreators.append(name)
                }
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
