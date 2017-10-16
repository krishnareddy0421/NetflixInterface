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
let AIRING_TODAY_URL = "https://api.themoviedb.org/3/tv/airing_today?api_key=\(API_KEY)&language=en-US&page=1"
let ON_THE_AIR_URL = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(API_KEY)&language=en-US&page=1"
let POPULAR_URL = "https://api.themoviedb.org/3/tv/popular?api_key=\(API_KEY)&language=en-US&page=1"
let TOP_RATED_URL = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(API_KEY)&language=en-US&page=1"


// MARK: - Cell Identifiers
let CATEGORY_CELL_IDENTIFIER = "categoryCell"
let TV_CELL_IDENTIFIER = "tvCell"

// MARK: - Segues
let TO_SIGNUP_SEGUE = "toSignUpVC"
let TO_HOME_SEGUE = "toHomeVC"
let TO_CATEGORY_SEGUE = "toCategoryVC"
let TO_DETAILS_SEGUE = "toDetailsVC"
