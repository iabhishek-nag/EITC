//
//  MovieViewControllerTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class MovieViewControllerTest: XCTestCase {
    var movieViewController: MovieViewController!
    var movieViewModel: MovieViewModel!
    var apiServiceManager: APIServiceProtocolMock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: MovieViewController.identifier()) as? MovieViewController else {
            fatalError("Controller Not Found")
        }
        apiServiceManager = APIServiceProtocolMock()
        movieViewModel = MovieViewModel(apiServiceManager: apiServiceManager)
        movieViewController = viewController
        movieViewController.viewModel = movieViewModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieViewController = nil
        movieViewModel = nil
        apiServiceManager = nil
    }

    func testShowProgress() throws {
        movieViewController.showProgress(status: true)

    }

    func testHandleError() throws {
        movieViewController.handleError(ErrorResponse(errorMessage: "Error"))
        
    }

}
