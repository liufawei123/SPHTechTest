//
//  SPHTechTestUITests.swift
//  SPHTechTestUITests
//
//  Created by yuanchun tang on 18/8/2019.
//

import XCTest

class SPHTechTestUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.otherElements[" 2005-Q4: 0"].tap()
        
        let lineChart1DatasetMobileDataUsageElement = app.otherElements["Line Chart. 1 dataset. Mobile Data Usage"]
        lineChart1DatasetMobileDataUsageElement.tap()
        lineChart1DatasetMobileDataUsageElement.tap()
        app.otherElements[" 2009-Q1: 107"].tap()
    }
}
