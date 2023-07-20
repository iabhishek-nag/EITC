//
//  LoginViewControllerTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class LoginViewControllerTest: XCTestCase {
    var viewModel: LoginViewModelProtocol!
    var viewController: LoginViewController!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = LoginViewModelProtocolMock()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let viewC = storyboard.instantiateViewController(withIdentifier: LoginViewController.identifier()) as? LoginViewController else {
            fatalError("Controller Not Found")
        }
        let navController = UINavigationController(rootViewController: viewC)

        navigationController = navController
        viewController = viewC
        viewController.viewModel = viewModel
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        viewController = nil
    }

    func testRequiredElementSetup() throws {
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController.viewModel)
    }

    func testNavigateToMovies() throws {
        print(navigationController.viewControllers.count)
        viewController.navigateToMovies()
        print(navigationController.viewControllers.count)
        let stackCount = viewController.navigationController?.viewControllers.count ?? 0
        print(stackCount)
    }

}
