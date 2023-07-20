//
//  APIServiceProtocol.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation
typealias CallbackVoid = () -> Void
typealias Callback<T> = (Result<T, ErrorResponse>) -> Void

protocol APIServiceProtocol {
    func getPopularMovies(language: String, page: Int, completion: @escaping (Callback<PopularMovie>))
}
