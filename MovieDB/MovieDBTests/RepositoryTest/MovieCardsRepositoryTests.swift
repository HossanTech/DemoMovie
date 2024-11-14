//
//  MovieCardsRepositoryTests.swift
//  MovieDBTests
//
//  Created by MohammadHossan on 14/11/2024.
//

import XCTest
@testable import MovieDB

final class MovieCardsRepositoryTests: XCTestCase {
  
  var fakeNetworkManager: FakeNetworkManager?
  var movieCardsRepository: MovieCardsRepository?
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    fakeNetworkManager = FakeNetworkManager()
    movieCardsRepository = MovieRepositoryImplementation(networkManager: fakeNetworkManager ?? FakeNetworkManager())
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    movieCardsRepository = nil
  }
  
  // when passes Movie list array will return with some data
  func test_Get_Movie_List_In_Success_Case() async {
    
    // GIVEN
    guard let url = URL(string: "MovieData") else {
      XCTFail("\(NetworkError.invalidURL)")
      return
    }
    
    let lists = try? await movieCardsRepository?.getMovieList(for: url)
    // WHEN
    guard let listItem = lists else {
      XCTFail("Movie List is nil")
      return
    }
    
    //THEN
    XCTAssertNotNil(listItem)
    XCTAssertTrue(listItem.results.count > 0)
    XCTAssertEqual(listItem.results.count, 20)
    XCTAssertEqual(listItem.results.first?.id, 278)
  }
  
  // When  Movie list is empty.
  func test_Get_Movie_List_In_Failure_Case() async {
    
    // GIVEN
    guard let url = URL(string: "MovieDataEmpty") else {
      XCTFail("\(NetworkError.invalidURL)")
      return
    }
    
    let lists = try? await movieCardsRepository?.getMovieList(for: url)
    
    //THEN
    XCTAssertNil(lists?.page)
    XCTAssertNil(lists?.results.first?.id)
    XCTAssertNil(lists?.results.first?.title)
    XCTAssertNil(lists?.results.first?.overview)
  }
}
