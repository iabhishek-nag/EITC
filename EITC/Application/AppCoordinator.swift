//
//  AppCoordinator.swift
//  EITC
//
//  Created by Abhishek Singh on 20/07/23.
//

import UIKit

class AppCoordinator: Coordinator {
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

    deinit {
        print("AppCoordinator Deinit")
    }

}
