//
//  MovieCollectionViewModelCell.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import Foundation

//sourcery: AutoMockable
protocol MovieCollectionCellViewModelProtocol {
    var title: String { get }
    var posterPathURL: String { get }
}

struct MovieCollectionCellViewModel: MovieCollectionCellViewModelProtocol {
    private let item: Movie
    init(item: Movie) {
        self.item = item
    }
    var title: String {
        return item.title
    }
    var posterPathURL: String {
        let imageURL = Configuration.shared.env.imageURL
        return imageURL + item.posterPath
    }
}
