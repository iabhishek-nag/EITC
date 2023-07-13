//
//  LoginViewController.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, IdentifierProtocol {
    // MARK: - Instance variables
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!

    var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Login"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        viewModel = LoginViewModel()
        setupBindings()
    }

    // MARK: User Actions
    func setupBindings() {
        emailField.rx.text.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
        passwordField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)

        viewModel
              .isValidForm
              .bind(to: loginButton.rx.isEnabled)
              .disposed(by: disposeBag)

        loginButton.rx.tap
          .subscribe(onNext: { [weak self] _ in
              self?.navigateToMovies()
          })
          .disposed(by: disposeBag)
    }

    func navigateToMovies() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: MovieViewController.identifier()) as? MovieViewController else {
            return
        }
        viewController.viewModel = MovieViewModel(apiServiceManager: APIServiceManager())
        navigationController?.pushViewController(viewController, animated: true)
    }

}
