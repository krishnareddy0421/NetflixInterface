//
//  Constants.swift
//  NetflixInterface
//
//  Created by vamsi krishna reddy kamjula on 10/14/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: - API Information
let API_KEY = "38c202b89452edcd18696b9e9962f08a"


// MARK: - Url's
let BASE_URL = "http://image.tmdb.org/t/p/w780/"
let TV_ON_THE_AIR = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(API_KEY)&language=en-US&page=1"


// MARK: - Cell Identifiers
let CATEGORY_CELL_IDENTIFIER = "categoryCell"


// MARK: - Segues
let TO_SIGNUP_SEGUE = "toSignUpVC"
let TO_HOME_SEGUE = "toHomeVC"
let TO_CATEGORY_SEGUE = "toCategory"
