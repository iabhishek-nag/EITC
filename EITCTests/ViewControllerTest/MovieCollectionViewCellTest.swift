//
//  MovieCollectionViewCellTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 19/07/23.
//

import XCTest
@testable import EITC

final class MovieCollectionViewCellTest: XCTestCase {

    var viewCell: MovieCollectionViewCell!
    var viewModel: MovieCollectionCellViewModelProtocol!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewCell = MovieCollectionViewCell()
        viewModel = MovieCollectionCellViewModelProtocolMock()
        viewCell.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        viewCell = nil
    }

    func testRequiredElementSetup() throws {
        XCTAssertNotNil(viewCell)
        XCTAssertNotNil(viewCell.viewModel)
    }

}
