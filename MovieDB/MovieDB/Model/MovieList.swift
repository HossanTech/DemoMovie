//
//  MovieList.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

// MARK: - MovieList
struct MovieList: Codable {
    let page: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
  let id: Int
  let title: String
  let overview: String
  let posterPath: String?
  let voteAverage: Double
}
typealias MovieResult = [Result]
