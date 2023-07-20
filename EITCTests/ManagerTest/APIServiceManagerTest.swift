//
//  APIServiceManagerTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
import OHHTTPStubs
@testable import EITC

final class APIServiceManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func stubRequest(host: String, responseFile: String) {
        stub(condition: isHost(host)) { _ in
          // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
          let stubPath = OHPathForFile(responseFile, type(of: self))
          return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
    }

    func testPopularMoviesForSuccessResponse() {
        let host = "api.themoviedb.org"
        let responseFile = "SuccessResponse.json"
        stubRequest(host: host, responseFile: responseFile)

        let responseExpectation = expectation(description: "return expected data of List")
        APIServiceManager().getPopularMovies(language: "en-US", page: 1) { (response) in
            switch response {
            case .success(let items):
                XCTAssertNotNil(items, "list: expected result achived")
                XCTAssertEqual(20, items.results.count)
                responseExpectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error, "error: Expectation fulfilled with error")
            }
        }
        waitForExpectations(timeout: 50) { error in
            if let error = error {
                XCTAssertNotNil(error, "Failed to get response from list webservice")
            }
        }
    }

    func testPopularMoviesForErrorResponse() {
        let host = "api.themoviedb.org"
        let responseFile = "ErrorResponse.json"
        stubRequest(host: host, responseFile: responseFile)

        let responseExpectation = expectation(description: "return expected data of List")
        APIServiceManager().getPopularMovies(language: "en-US", page: 1) { (response) in
            switch response {
            case .success( let item):
                XCTAssertNil(item, "error: item should be nil")
            case .failure(let error):
                XCTAssertNotNil(error, "error: Expectation fulfilled with error")
                responseExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 50) { error in
            if let error = error {
                XCTAssertNotNil(error, "Failed to get response from list webservice")
            }
        }
    }

}
