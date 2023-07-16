//
//  MovieViewModelTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
import RxSwift
@testable import EITC

final class MovieViewModelTest: XCTestCase {
    var movieViewModel: MovieViewModel!
    var apiServiceManager: APIServiceProtocolMock!

    let disposeBag = DisposeBag()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiServiceManager = APIServiceProtocolMock()
        movieViewModel = MovieViewModel(apiServiceManager: apiServiceManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieViewModel = nil
        apiServiceManager = nil
    }

    func testPopularMoviesSuccess() throws {
        movieViewModel.movies.subscribe { movies in
            XCTAssertEqual(20, movies.count)
        }.disposed(by: disposeBag)

        guard let response = Utilities.readJSON("SuccessResponse", type: PopularMovie.self) else {
            return
        }
        apiServiceManager.callbackResult = .success(response)
        movieViewModel.getPopularMovies()
//        XCTAssertEqual(20, movieViewModel.movies)
//        XCTAssertNotNil(movieViewModel.boxDetail.value)
    }

    func testPopularMoviesError() throws {
        movieViewModel.errorEvent.subscribe { error in
            XCTAssertNotNil(error)
        }.disposed(by: disposeBag)

        guard let response = Utilities.readJSON("ErrorResponse", type: ErrorResponse.self) else {
            return
        }
        apiServiceManager.callbackResult = .failure(response)
        movieViewModel.getPopularMovies()
//        sourceView.verify(.handleError(.any), count: 1)
//        XCTAssertNil(viewModel.boxDetail.value)
    }
}
