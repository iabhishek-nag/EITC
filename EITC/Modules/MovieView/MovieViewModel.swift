//
//  MovieViewModel.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol MovieViewModelProtocol {
    var movies: PublishSubject<[Movie]> { get set }
    var errorEvent: PublishSubject<ErrorResponse> { get set }
    var isLoaderActive: PublishSubject<Bool> { get set }

    func getPopularMovies()
}

struct MovieViewModel: MovieViewModelProtocol {
    // MARK: - Instance variables
    var apiServiceManager: APIServiceProtocol
    var movies = PublishSubject<[Movie]>()
    var errorEvent = PublishSubject<ErrorResponse>()
    var isLoaderActive = PublishSubject<Bool>()

    // MARK: - Actions
    func getPopularMovies() {
        let page = 1
        let language = "en-US"
        isLoaderActive.onNext(true)
        apiServiceManager.getPopularMovies(language: language, page: page) { (result) in
            isLoaderActive.onNext(false)
            switch result {
            case .success(let value):
                debugPrint(value.results.count)
                movies.onNext(value.results)
            case .failure(let error):
                debugPrint(error)
                errorEvent.onNext(error)
            }
        }
    }

}
