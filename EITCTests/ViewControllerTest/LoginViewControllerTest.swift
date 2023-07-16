//
//  LoginViewControllerTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class LoginViewControllerTest: XCTestCase {
    var loginViewModel: LoginViewModel!
    var loginViewController: LoginViewController!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginViewModel = LoginViewModel()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: LoginViewController.identifier()) as? LoginViewController else {
            fatalError("Controller Not Found")
        }
        viewController.viewModel = LoginViewModel()
        let navController = UINavigationController(rootViewController: viewController)

        navigationController = navController
        loginViewController = viewController
        loginViewController.viewModel = loginViewModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginViewModel = nil
        loginViewController = nil
    }

    func testNavigateToMovies() throws {
        print(navigationController.viewControllers.count)
        loginViewController.navigateToMovies()
        print(navigationController.viewControllers.count)
        let stackCount = loginViewController.navigationController?.viewControllers.count ?? 0
        print(stackCount)
    }

}
