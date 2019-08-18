//
//  DataManager.swift
//  SPHTechTestTests
//
//  Created by yuanchun tang on 18/8/2019.
//

import XCTest
@testable import SPHTechTest

class DataManager: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        let expectation = self.expectation(description: "DataManager")
        var recordedStatuses: [MobileDataModel]?
        let concurrentQueue = DispatchQueue(label: "group.queue", attributes: .concurrent)
        concurrentQueue.async {
            dataManagerInstance.getModesl({ (mode, error) in
                recordedStatuses = mode
                expectation.fulfill()
            })
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(recordedStatuses)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
