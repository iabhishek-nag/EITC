//
//  PopularMovie.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation

struct PopularMovie: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
