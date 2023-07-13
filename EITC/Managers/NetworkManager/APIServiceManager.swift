//
//  APIServiceManager.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation
import Alamofire

struct APIServiceManager {
    // MARK: - Root Methods
    func sendAPIRequest<T: Decodable>(
        service: APIService,
        completion: @escaping(Callback<T>)) {
        // Method body
        let url = service.baseUrl + service.path
        let request = AF.request(url, method: service.method,
                                 parameters: service.queryParams,
                                 encoding: URLEncoding.queryString,
                                 headers: nil, interceptor: nil)

        request.responseDecodable(of: T.self, queue: .main, decoder: JSONDecoder()) { (response) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(ErrorResponse(error: error)))
            }
        }
    }

}

extension APIServiceManager: APIServiceProtocol {
    // MARK: - API Methods
    func getPopularMovies(language: String, page: Int, completion: @escaping (Callback<PopularMovie>)) {
        sendAPIRequest(service: APIService.popularMovies(language: language, page: page)) { (response: Result<PopularMovie, ErrorResponse>) in
            completion(response)
        }
    }

}
