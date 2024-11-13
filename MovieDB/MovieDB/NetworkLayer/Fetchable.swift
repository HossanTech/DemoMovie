//
//  Fetchable.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

// MARK: -  Protocol for GET Movie List.

protocol Fetchable {
  
  func get(url: URL) async throws -> Data
}

