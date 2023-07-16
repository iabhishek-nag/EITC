//
//  APIServiceProtocolMock.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

class APIServiceProtocolMock: APIServiceProtocol {
    var callbackResult: Result<Any, ErrorResponse>?
    private func getResponse<T: Decodable>(completion: @escaping(Callback<T>)) {
        switch callbackResult {
        case .success(let value):
            if let value = value as? T {
                completion(.success(value))
            } else {
                completion(.failure(ErrorResponse(errorMessage: "Type Mismatch")))
            }
        case .failure(let error):
            completion(.failure(error))
        case .none:
            completion(.failure(ErrorResponse(errorMessage: "No Data")))
        }
    }

    func getPopularMovies(language: String, page: Int, completion: @escaping (EITC.Callback<EITC.PopularMovie>)) {
        getResponse(completion: completion)
    }

}
