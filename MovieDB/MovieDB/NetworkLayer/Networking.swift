//
//  Networking.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

/// Protocol for network-related operations.
protocol Networking {
  /// Fetches data from the given URL asynchronously.
  /// - Parameters:
  /// - url: The URL to fetch data from.
  /// - delegate: An optional delegate for handling task-specific events.
  /// - Returns: A tuple containing the fetched `Data` and the `URLResponse`.
  
  func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension Networking {
  
  /// Fetches data from the given URL without a delegate.
  /// - Parameter url: The URL to fetch data from.
  /// - Returns: A tuple containing the fetched `Data` and the `URLResponse`.
  func data(from url: URL) async throws -> (Data, URLResponse) {
    try await data(from: url, delegate: nil)
  }
}

extension URLSession: Networking {}

