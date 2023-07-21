//
//  LoginViewModelProtocolMock.swift
//  EITCTests
//
//  Created by Abhishek Singh on 19/07/23.
//

import XCTest
import RxSwift
import RxCocoa
@testable import EITC

struct LoginViewModelProtocolMock: LoginViewModelProtocol {
    var emailSubject: RxRelay.BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var passwordSubject: RxRelay.BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var isValidForm: RxSwift.Observable<Bool> = BehaviorRelay(value: true).asObservable()
    func goToMovies() {
    }
}
