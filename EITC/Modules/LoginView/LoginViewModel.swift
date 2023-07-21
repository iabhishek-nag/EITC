//
//  LoginViewModel.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation
import RxSwift
import RxCocoa

//sourcery: AutoMockable
protocol LoginViewModelProtocol {
    var emailSubject: BehaviorRelay<String?> { get set }
    var passwordSubject: BehaviorRelay<String?> { get set }
    var isValidForm: Observable<Bool> { get }
    func goToMovies()
}

struct LoginViewModel: LoginViewModelProtocol {
    // MARK: - Instance variables
    weak var coordinator : AppCoordinator!
    var emailSubject = BehaviorRelay<String?>(value: "")
    var passwordSubject = BehaviorRelay<String?>(value: "")

    // MARK: - Helper
    var isValidForm: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject) { email, password in
            guard let email = email, let password = password else {
                return false
            }
            return email.isValidEmail && password.isValidPassword
        }
    }

    func goToMovies() {
        coordinator.goToMovies()
    }

}
