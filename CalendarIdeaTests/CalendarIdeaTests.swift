//
//  CalendarIdeaTests.swift
//  CalendarIdeaTests
//
//  Created by Trevor Rose on 6/6/22.
//

import XCTest
@testable import CalendarIdea

final class CalendarIdeaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetEventDate() {
        let date = getEventDate(eventDate: Date(timeIntervalSince1970: 1654868070))
        XCTAssertEqual(date, "Friday, June 10")
    }
    
    
    // Tests for getEventTime
    func testGetEventTime() {
        let time = getEventTime(timestamp: 1654846230)
        XCTAssertEqual(time, "12:30 AM")
    }
    
    func testGetEventTimeMidnight() {
        let time = getEventTime(timestamp: 1654844430)
        XCTAssertEqual(time, "12:00 AM")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
