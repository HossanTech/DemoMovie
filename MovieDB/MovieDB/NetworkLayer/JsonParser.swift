//
//  JsonParser.swift
//  MovieDB
//
//  Created by MohammadHossan on 13/11/2024.
//

import Foundation

protocol JsonParser {
  func parse<T: Decodable>(data: Data, type: T.Type)throws -> T
}

// MARK: - Parsing the json.
extension JsonParser {
  
  func parse<T: Decodable>(data: Data, type: T.Type)throws -> T {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
      return try decoder.decode(T.self, from: data )
    } catch {
      throw NetworkError.parsingError
    }
  }
}
