//
//  NetworkError.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case parsingError
  case dataNotFound
}

// MARK: - Passing the Custom Error Message.
extension NetworkError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return NSLocalizedString("Invalid URL", comment: "invalidURL")
    case .parsingError:
      return NSLocalizedString("Encountered Parsing Error", comment: "parsingError")
    case .dataNotFound:
      return NSLocalizedString("Failed to get data from API", comment: "dataNotFound")
    }
  }
}
