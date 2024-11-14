//
//  FakeMovieCardsRepository.swift
//  MovieDBTests
//
//  Created by MohammadHossan on 14/11/2024.
//

import Foundation
@testable import MovieDB

class FakeMovieCardsRepository: MovieCardsRepository {
  
  func getMovieList(for url: URL) async throws -> MovieDB.MovieList {
    
    do {
      let bundle = Bundle(for: FakeNetworkManager.self)
      guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
        throw NetworkError.invalidURL
      }
      let data = try Data(contentsOf: path)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let lists = try decoder.decode(MovieList.self, from: data )
      return lists
    } catch {
      throw NetworkError.dataNotFound
    }
  }
}
