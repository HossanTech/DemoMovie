//
//  MovieDBUITests.swift
//  MovieDBUITests
//
//  Created by MohammadHossan on 13/11/2024.
//

import XCTest

final class MovieDBUITests: XCTestCase {
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  func testAppTitle() throws {
      // Initialize the app and launch it
      let app = XCUIApplication()
      app.launch()
      
      // Access the navigation bar title with identifier "Movie List"
      let appTitle = app.navigationBars["Movie List"].staticTexts["Movie List"]
      
      // Assert that the app title exists
      XCTAssertTrue(appTitle.exists, "The app title 'Movie List' should exist on the navigation bar")
  }
}
