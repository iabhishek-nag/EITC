//
//  MovieCollectionViewCell.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell, IdentifierProtocol {
    // MARK: - Instance variables
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    var viewModel: MovieCollectionCellViewModel? = nil {
        didSet {
            titleLabel.text = viewModel?.title
            imageView.setImageWith(imageUrl: viewModel?.posterPathURL)
        }
    }
}
