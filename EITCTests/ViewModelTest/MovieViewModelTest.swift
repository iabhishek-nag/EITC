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
    var viewModel: MovieViewModel!
    var apiServiceManager: APIServiceProtocolMock!

    var scheduler: TestScheduler!
    var movieResult: TestableObserver<[Movie]>!
    var errorResult: TestableObserver<ErrorResponse>!

    var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiServiceManager = APIServiceProtocolMock()
        viewModel = MovieViewModel(apiServiceManager: apiServiceManager)

        scheduler = TestScheduler(initialClock: 0)
        movieResult = scheduler.createObserver([Movie].self)
        errorResult = scheduler.createObserver(ErrorResponse.self)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        apiServiceManager = nil
    }

    func testRequiredElementSetup() throws {
        XCTAssertNotNil(viewModel)
        XCTAssertNotNil(viewModel.apiServiceManager)
        XCTAssertNotNil(viewModel.errorEvent)
        XCTAssertNotNil(viewModel.movies)
    }

    func testPopularMoviesSuccess() throws {
        viewModel.movies.subscribe { movies in
            XCTAssertEqual(20, movies.count)
        }.disposed(by: disposeBag)

        guard let response = Utilities.readJSON("SuccessResponse", type: PopularMovie.self) else {
            return
        }
        viewModel.movies.bind(to: movieResult).disposed(by: disposeBag)
        viewModel.errorEvent.bind(to: errorResult).disposed(by: disposeBag)
        apiServiceManager.callbackResult = .success(response)
        viewModel.getPopularMovies()

        scheduler.start()
        XCTAssertEqual(movieResult.events, [.next(0, response.results)])
    }

    func testPopularMoviesError() throws {
        viewModel.errorEvent.subscribe { error in
            XCTAssertNotNil(error)
        }.disposed(by: disposeBag)

        guard let response = Utilities.readJSON("ErrorResponse", type: ErrorResponse.self) else {
            return
        }
        viewModel.errorEvent.bind(to: errorResult).disposed(by: disposeBag)
        apiServiceManager.callbackResult = .failure(response)
        viewModel.getPopularMovies()

        scheduler.start()
        XCTAssertEqual(errorResult.events, [.next(0, response)])
    }
}
