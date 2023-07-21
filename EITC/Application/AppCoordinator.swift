//
//  AppCoordinator.swift
//  EITC
//
//  Created by Abhishek Singh on 20/07/23.
//

import UIKit

class AppCoordinator: Coordinator, ActivityProtocol {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        print("App Coordinator Start")
        goToLogin()
    }

    func goToLogin(){
        let viewController = LoginViewController.instantiate()
        let viewModel = LoginViewModel(coordinator: self)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

    func goToMovies() {
        let viewController = MovieViewController.instantiate()
        var viewModel = MovieViewModel(apiServiceManager: APIServiceManager())
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }

    func showAlert(title: String?, message: String?) {
        let alertController = getAlertViewController(title: title, message: message)
        navigationController.present(alertController, animated: true)
    }

    func showActivityLoader() {
        showLoader()
    }

    func hideActivityLoader() {
        hideLoader()
    }

    // Private Helper function
    private func getAlertViewController(title: String?,
                                        message: String?,
                                        dismissTitle: String? = nil,
                                        dismissAction: (() -> Void)? = nil) -> UIAlertController {
        // create alert controller
        var titleText = ""
        var dismissText = "Ok"
        if title != nil {
            titleText = title ?? ""
        }
        if dismissTitle != nil {
            dismissText = dismissTitle ?? ""
        }
        let alertController = UIAlertController(title: titleText, message: message, preferredStyle: .alert)
        let dismissAlertAction = UIAlertAction(title: dismissText, style: .default) { _ in
            dismissAction?()
        }
        alertController.addAction(dismissAlertAction)
        return alertController
    }

    deinit {
        print("AppCoordinator Deinit")
    }

}
