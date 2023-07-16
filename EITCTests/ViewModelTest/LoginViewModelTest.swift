//
//  LoginViewModelTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class LoginViewModelTest: XCTestCase {
    var loginViewModel: LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginViewModel = nil
    }

    func testIsValidFormFalse() throws {
        loginViewModel.isValidForm.subscribe { status in
            XCTAssertEqual(status, false)
        }.dispose()
    }

    func testIsValidFormTrue() throws {
        loginViewModel.emailSubject.accept("abhi@nag.com")
        loginViewModel.passwordSubject.accept("123456789")
        loginViewModel.isValidForm.subscribe { status in
            XCTAssertEqual(status, true)
        }.dispose()
    }

}
