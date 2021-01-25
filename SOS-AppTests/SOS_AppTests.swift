//
//  SOS_AppTests.swift
//  SOS-AppTests
//
//  Created by Francesco Facca on 21/01/2021.
//

import XCTest
@testable import SOS_App

class SOS_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchEmergencyAPI() {
       let exp = expectation(description:"fetching API data from server")
       let session: URLSession = URLSession(configuration: .default)
       let url = URL(string: "https://emergency-phone-numbers.herokuapp.com/country/us")
       session.dataTask(with: url!) { data, response, error in
          XCTAssertNil(error)
          exp.fulfill()
       }.resume()
       waitForExpectations(timeout: 10.0) { (error) in
          print(error?.localizedDescription ?? "error")
       }
    }

}
