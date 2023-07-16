//
//  MovieCollectionCellViewModelTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class MovieCollectionCellViewModelTest: XCTestCase {
    var movieCollectionCellViewModel: MovieCollectionCellViewModel!
    var movie = Movie(id: 1, title: "Abc", posterPath: "/123.jpg")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieCollectionCellViewModel = MovieCollectionCellViewModel(item: movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieCollectionCellViewModel = nil
    }

    func testProperties() throws {
        XCTAssertEqual(movie.title, movieCollectionCellViewModel.title)
        let imageURL = Configuration.shared.env.imageURL
        XCTAssertEqual(imageURL + movie.posterPath, movieCollectionCellViewModel.posterPathURL)
    }

}
