//
//  MovieViewModelTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
import RxSwift
import RxTest
@testable import EITC

final class MovieViewModelTest: XCTestCase {
    var movieViewModel: MovieViewModel!
    var apiServiceManager: APIServiceProtocolMock!

    var scheduler: TestScheduler!
    var movieResult: TestableObserver<[Movie]>!
    var errorResult: TestableObserver<ErrorResponse>!

    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiServiceManager = APIServiceProtocolMock()
        movieViewModel = MovieViewModel(apiServiceManager: apiServiceManager)

        scheduler = TestScheduler(initialClock: 0)
        movieResult = scheduler.createObserver([Movie].self)
        errorResult = scheduler.createObserver(ErrorResponse.self)
        disposeBag = DisposeBag()
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
        movieViewModel.movies.bind(to: movieResult).disposed(by: disposeBag)
        movieViewModel.errorEvent.bind(to: errorResult).disposed(by: disposeBag)
        apiServiceManager.callbackResult = .success(response)
        movieViewModel.getPopularMovies()

        scheduler.start()
        XCTAssertEqual(movieResult.events, [.next(0, response.results)])
    }

    func testPopularMoviesError() throws {
        movieViewModel.errorEvent.subscribe { error in
            XCTAssertNotNil(error)
        }.disposed(by: disposeBag)

        guard let response = Utilities.readJSON("ErrorResponse", type: ErrorResponse.self) else {
            return
        }
        movieViewModel.errorEvent.bind(to: errorResult).disposed(by: disposeBag)
        apiServiceManager.callbackResult = .failure(response)
        movieViewModel.getPopularMovies()

        scheduler.start()
        XCTAssertEqual(errorResult.events, [.next(0, response)])
    }
}
