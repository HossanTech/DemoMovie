//
//  Endpoint.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

struct Endpoint {
  
  static let movieImageUrl = "https://image.tmdb.org/t/p/w500"
  static let apiKey = ProcessInfo.processInfo.environment["MOVIE_DB_API_KEY"] ?? ""
  static let baseURL = "https://api.themoviedb.org/3/movie/top_rated"
  
  static var movieListURL: String {
    return "\(baseURL)?api_key=\(apiKey)"
  }
}
