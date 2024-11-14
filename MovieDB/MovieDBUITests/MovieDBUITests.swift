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
    
    let app = XCUIApplication()
    app.launch()
    let appTitle = app.navigationBars["Movie List"].staticTexts["Movie List"]
    XCTAssertTrue(appTitle.exists)
    appTitle.tap()
  }
}
