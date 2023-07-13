//
//  Movie.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
    }
}
