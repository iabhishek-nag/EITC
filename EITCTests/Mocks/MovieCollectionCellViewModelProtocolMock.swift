//
//  MovieCollectionCellViewModelProtocolMock.swift
//  EITCTests
//
//  Created by Abhishek Singh on 19/07/23.
//

import Foundation
@testable import EITC

struct MovieCollectionCellViewModelProtocolMock: MovieCollectionCellViewModelProtocol {
    var title: String = "One"
    var posterPathURL: String = "path"
}
