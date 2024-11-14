//
//  MovieListViewModelTest.swift
//  MovieDBTests
//
//  Created by MohammadHossan on 14/11/2024.
//

import XCTest
@testable import MovieDB

final class MovieListViewModelTest: XCTestCase {
  
  var fakePeopleCardsRepository: FakeMovieCardsRepository?
  var  movieListViewModel: MovieListViewModel?
  
  @MainActor override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    fakePeopleCardsRepository = FakeMovieCardsRepository()
    movieListViewModel = MovieListViewModel(repository: fakePeopleCardsRepository ?? FakeMovieCardsRepository())
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    fakePeopleCardsRepository = nil
    movieListViewModel = nil
  }
  
  // when url is correct, should have some data in Movie List
  func test_getMovieList_When_URL_Is_Correct() async {
    
    // GIVEN
    await movieListViewModel?.getMovieList(urlStr: "MovieData")
    
    // WHEN
    let movieList =  await movieListViewModel?.movieLists
    guard let movieList = movieList else {
      XCTFail("List is nil")
      return
    }
    
    // THEN
    // checking records count and movie note on success
    XCTAssertNotNil(movieList)
    XCTAssertEqual(movieList.count, 20)
    XCTAssertEqual(movieList.first?.title, "The Shawshank Redemption")
    XCTAssertEqual(movieList.first?.voteAverage, 8.7)
  }
  
  // When Api fails, it will throw dataNotFound error
  func testGetMovieList_When_APIFailure() async {
    
    // GIVEN
    XCTAssertNotNil(movieListViewModel)
    await movieListViewModel?.getMovieList(urlStr: "MovieDataEmpty")
    
    // WHEN
    let movieList = await movieListViewModel?.movieLists
    guard let movieList = movieList else {
      XCTFail("List is nil")
      return
    }
    // THEN
    // number of records will be zero
    XCTAssertEqual(movieList.count, 0)
    XCTAssertNil(movieList.first?.id)
    XCTAssertNil(movieList.first?.posterPath)
    XCTAssertNil(movieList.first?.title)
    XCTAssertNil(movieList.first?.voteAverage)
  }
  
  // when url is not empty but incorrect format
  func testGetMovieList_When_URL_is_Incorrect() async {
    
    // GIVEN
    XCTAssertNotNil(movieListViewModel)
    await movieListViewModel?.getMovieList(urlStr: "MovieCardsResponseWrongURL")
    
    // WHEN
    let movieList = await movieListViewModel?.movieLists
    guard let movieList = movieList else {
      XCTFail("List is nil")
      return
    }
    // THEN
    // Empty records
    XCTAssertEqual(movieList.count, 0)
    XCTAssertNil(movieList.first?.id)
    XCTAssertNil(movieList.first?.posterPath)
    XCTAssertNil(movieList.first?.title)
    XCTAssertNil(movieList.first?.voteAverage)
  }
}
