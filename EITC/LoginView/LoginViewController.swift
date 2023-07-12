//
//  LoginViewController.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Instance variables
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!

    var viewModel: LoginViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Login"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
    }

    // MARK: User Actions

}
