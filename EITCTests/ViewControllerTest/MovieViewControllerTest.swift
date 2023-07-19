//
//  MovieViewControllerTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
import SwiftyMocky
import RxSwift
import RxCocoa
import RxTest
@testable import EITC

final class MovieViewControllerTest: XCTestCase {
    var viewModel: MovieViewModelProtocol!
    var viewController: MovieViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewC = storyboard.instantiateViewController(withIdentifier: MovieViewController.identifier()) as? MovieViewController else {
            fatalError("Controller Not Found")
        }
        viewModel = MovieViewModelProtocolMock(callbackResult: nil)
        viewController = viewC
        viewController.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        viewModel = nil
    }

    func testRequiredElementSetup() throws {
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController.viewModel)
    }

    func testShowProgress() throws {
        viewController.showProgress(status: true)
    }

    func testHandleError() throws {
        viewController.handleError(ErrorResponse(errorMessage: "Error"))
    }

}
