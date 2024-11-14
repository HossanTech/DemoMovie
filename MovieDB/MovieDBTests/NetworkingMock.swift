//
//  NetworkingMock.swift
//  MovieDBTests
//
//  Created by MohammadHossan on 14/11/2024.
//

import Foundation
@testable import MovieDB

class NetworkingMock: Networking {
  
  static var data: Data?
  
  func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
    guard let data = NetworkingMock.data else {
      throw NetworkError.dataNotFound
    }
    return (data, URLResponse())
  }
}
