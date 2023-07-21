//
//  MovieViewController.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import UIKit
import RxSwift
import RxCocoa
import ProgressHUD

class MovieViewController: UIViewController, Storyboarded, IdentifierProtocol {
    // MARK: - Instance variables
    @IBOutlet weak private var movieCollectionView: UICollectionView!

    var viewModel: MovieViewModelProtocol!
    let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Popular Movies"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        setupBindings()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getPopularMovies()
    }

    // MARK: User Actions
    func setupBindings() {
        viewModel.isLoaderActive.subscribe { [weak self] status in
            self?.activityBarLoading(status: status)
        }.disposed(by: disposeBag)

        viewModel.errorEvent.subscribe { [weak self] error in
            self?.handleError(error)
        }.disposed(by: disposeBag)

        viewModel.movies.bind(to: movieCollectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier(), for: indexPath) as! MovieCollectionViewCell
            cell.viewModel = MovieCollectionCellViewModel(item: element)
            return cell
        }
        .disposed(by: disposeBag)

        movieCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }

    // MARK: Helper Function
    func activityBarLoading(status: Bool) {
        viewModel.activityBar(show: status)
    }

    func handleError(_ error: Error) {
        viewModel.handleError(error)
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 10) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
