//
//  Do_not_disturb_UITests.swift
//  Do not disturb UITests
//
//  Created by Amitosh Swain Mahapatra on 27/05/24.
//

import XCTest

final class Do_not_disturb_UITests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  @MainActor func testExample() throws {
    // UI tests must launch the application that they test.

    let app = XCUIApplication()
    app.launch()
    setupSnapshot(app)
    app /*@START_MENU_TOKEN@*/.staticTexts[
      "Report spam call"
    ] /*[[".disclosureTriangles[\"Report spam call\"].staticTexts[\"Report spam call\"]",".staticTexts[\"Report spam call\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .tap()
    snapshot("01ReportSpamCall")
    app /*@START_MENU_TOKEN@*/.staticTexts[
      "Report spam SMS"
    ] /*[[".disclosureTriangles[\"Report spam SMS\"].staticTexts[\"Report spam SMS\"]",".staticTexts[\"Report spam SMS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .tap()
    snapshot("02ReportSpamSMS")
    app /*@START_MENU_TOKEN@*/.staticTexts[
      "Report spam call"
    ] /*[[".disclosureTriangles[\"Report spam call\"].staticTexts[\"Report spam call\"]",".staticTexts[\"Report spam call\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .tap()
    app /*@START_MENU_TOKEN@*/.staticTexts[
      "Report spam SMS"
    ] /*[[".disclosureTriangles[\"Report spam SMS\"].staticTexts[\"Report spam SMS\"]",".staticTexts[\"Report spam SMS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .tap()
    app /*@START_MENU_TOKEN@*/.staticTexts[
      "Setup"
    ] /*[[".disclosureTriangles[\"Setup\"].staticTexts[\"Setup\"]",".staticTexts[\"Setup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      .tap()
    snapshot("03Setup")

    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
