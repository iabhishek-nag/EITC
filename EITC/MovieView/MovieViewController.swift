//
//  MovieViewController.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import UIKit

class MovieViewController: UIViewController {
    // MARK: - Instance variables

    var viewModel: MovieViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Popular Movies"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
    }

    // MARK: User Actions
}
