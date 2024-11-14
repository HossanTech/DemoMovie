//
//  FakeNetworkManager.swift
//  MovieDBTests
//
//  Created by MohammadHossan on 14/11/2024.
//

import Foundation
@testable import MovieDB

class FakeNetworkManager: Fetchable {
  
  func get(url: URL) async throws -> Data {
    
    do {
      let bundle = Bundle(for: FakeNetworkManager.self)
      guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
        throw NetworkError.invalidURL
      }
      let data = try Data(contentsOf: path)
      return data
    } catch {
      throw NetworkError.dataNotFound
    }
  }
}
