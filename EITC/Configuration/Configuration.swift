//
//  Configuration.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation
// Singleton that defines the settings based on the environment/scheme/target
final class Configuration {

    private init() { }
    static let shared = Configuration()

    lazy var env: Environment = {
        #if DEBUG
        return Environment.debug
        #else
        return Environment.release
        #endif
    }()
}

/*
 Environment would be useful when multiple target/environments are there
 */
enum Environment: String {
    // Add each environment
    case debug
    case release

    // Create envrionment based computed property like baseURL, APIKeys
    var baseURL: String {
        switch self {
        case .debug:
            return "https://api.themoviedb.org/3/"
        case .release:
            return "https://api.themoviedb.org/3/"
        }
    }

    var imageURL: String {
        switch self {
        case .debug:
            return "https://www.themoviedb.org/t/p/w300_and_h450_bestv2"
        case .release:
            return "https://www.themoviedb.org/t/p/w300_and_h450_bestv2"
        }
    }

    var apiKey: String {
        switch self {
        case .debug:
            return "07f181e50c13d8909f10a8501a08641f"
        case .release:
            return "07f181e50c13d8909f10a8501a08641f"
        }
    }
}
