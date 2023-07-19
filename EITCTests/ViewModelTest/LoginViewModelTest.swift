//
//  LoginViewModelTest.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import XCTest
@testable import EITC

final class LoginViewModelTest: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testRequiredElementSetup() throws {
        XCTAssertNotNil(viewModel)
    }

    func testIsValidFormFalse() throws {
        viewModel.isValidForm.subscribe { status in
            XCTAssertEqual(status, false)
        }.dispose()
    }

    func testIsValidFormTrue() throws {
        viewModel.emailSubject.accept("abhi@nag.com")
        viewModel.passwordSubject.accept("123456789")
        viewModel.isValidForm.subscribe { status in
            XCTAssertEqual(status, true)
        }.dispose()
    }

}
