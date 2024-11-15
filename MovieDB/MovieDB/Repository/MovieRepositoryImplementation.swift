//
//  MovieRepositoryImplementation.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

protocol MovieCardsRepository {
  func getMovieList(for url: URL) async throws -> MovieList
}

struct MovieRepositoryImplementation {
  private let networkManager: Fetchable
  
  init(networkManager: Fetchable) {
    self.networkManager = networkManager
  }
}

// MARK: - Movie Repository Implementation.
extension MovieRepositoryImplementation: MovieCardsRepository, JsonParser {
  func getMovieList(for url: URL) async throws -> MovieList {
    do {
      let listsData = try await networkManager.get(url: url)
      return try parse(data: listsData, type: MovieList.self)
    } catch {
      throw error
    }
  }
}
