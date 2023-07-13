//
//  APIService.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation
import Alamofire

enum APIService {
    case popularMovies(language: String, page: Int)
}

extension APIService {
    var baseUrl: String {
        return Configuration.shared.env.baseURL
    }

    var apiKey: String {
        return Configuration.shared.env.apiKey
    }

    var path: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }

    var queryParams: [String: String] {
        switch self {
        case let .popularMovies(language, page):
            return ["language": language, "page": "\(page)", "api_key": apiKey]
        }
    }

    var bodyParams: Any? {
        switch self {
        default:
            return nil
        }
    }

}
