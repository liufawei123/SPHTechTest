//
//  APIManager.swift
//  SPHTechTestTests
//
//  Created by yuanchun tang on 18/8/2019.
//

import XCTest
@testable import SPHTechTest

class APIManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetData() {
        let expectation = self.expectation(description: "DataManager")
        var recordedStatuses: DatastoreSearch?
        let concurrentQueue = DispatchQueue(label: "group.queue", attributes: .concurrent)
        concurrentQueue.async {
            apiManagerInstance.datastoreSearch("", 100, completionHandler: { (mode, error) in
                recordedStatuses = mode
                expectation.fulfill()
            })
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(recordedStatuses?.result)
    }
    
    func testSuccessGetData() {
        let expectation = self.expectation(description: "DataManager")
        var recordedStatuses: DatastoreSearch?
        let concurrentQueue = DispatchQueue(label: "group.queue", attributes: .concurrent)
        concurrentQueue.async {
            apiManagerInstance.datastoreSearch("a807b7ab-6cad-4aa6-87d0-e283a7353a0f", 20, completionHandler: { (mode, error) in
                recordedStatuses = mode
                expectation.fulfill()
            })
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(recordedStatuses?.result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
