//
//  Mocks.swift
//  EITCTests
//
//  Created by Abhishek Singh on 19/07/23.
//

import XCTest
import RxSwift
@testable import EITC

struct MovieViewModelProtocolMock: MovieViewModelProtocol {
    var callbackResult: Result<[Movie], ErrorResponse>?

    var movies: PublishSubject<[Movie]> = PublishSubject<[Movie]>()
    var errorEvent: PublishSubject<ErrorResponse> = PublishSubject<ErrorResponse>()
    var isLoaderActive: PublishSubject<Bool> = PublishSubject<Bool>()

    func getPopularMovies() {
        switch callbackResult {
        case .success(let value):
            movies.onNext(value)
        case .failure(let error):
            errorEvent.onNext(error)
        case .none:
            errorEvent.onNext(ErrorResponse(errorMessage: "No Data"))
        }
    }

}
