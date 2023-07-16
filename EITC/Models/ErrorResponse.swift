//
//  ErrorResponse.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation
// MARK: - ErrorResponse
struct ErrorResponse: Codable, Error, Equatable {
    let statusCode: Int?
    let statusMessage: String
    let success: Bool

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }

    init(error: Error) {
        if let errorResponse = error as? ErrorResponse {
            self = errorResponse
        } else if let afError = error.asAFError {
            statusMessage = afError.errorDescription ?? afError.localizedDescription
            statusCode = afError.responseCode
            success = false
        } else {
            statusMessage = error.localizedDescription
            statusCode = nil
            success = false
        }
    }

    init(errorMessage: String) {
        statusMessage = errorMessage
        statusCode = nil
        success = false
    }

}
