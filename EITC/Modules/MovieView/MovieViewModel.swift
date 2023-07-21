//
//  MovieViewModel.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation
import RxSwift

protocol MovieViewModelProtocol {
    var movies: PublishSubject<[Movie]> { get set }
    var errorEvent: PublishSubject<ErrorResponse> { get set }
    var isLoaderActive: PublishSubject<Bool> { get set }

    func getPopularMovies()
    func activityBar(show: Bool)
    func handleError(_ error: Error)
}

struct MovieViewModel: MovieViewModelProtocol {
    // MARK: - Instance variables
    weak var coordinator : AppCoordinator!
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

    func activityBar(show: Bool) {
        if show {
            coordinator.showActivityLoader()
        } else {
            coordinator.hideActivityLoader()
        }
    }

    func handleError(_ error: Error) {
        var errorMessage = error.localizedDescription
        if let errorResponse = error as? ErrorResponse {
            errorMessage = errorResponse.statusMessage
        }
        coordinator.showAlert(title: "Error!", message: errorMessage)
    }

}
