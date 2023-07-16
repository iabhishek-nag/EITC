//
//  UIViewController.swift
//  EITC
//
//  Created by Abhishek Singh on 13/07/23.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String?, message: String?) {
        let alertController = getAlertViewController(title: title, message: message)
        // present alert controller
        present(alertController, animated: true, completion: nil)
    }

    func presentAlert(title: String?,
                      message: String?,
                      dismissTitle: String?,
                      dismissAction: (() -> Void)?) {
        let alertController = getAlertViewController(title: title, message: message, dismissTitle:
            dismissTitle, dismissAction: dismissAction)
        // present alert controller
        present(alertController, animated: true, completion: nil)
    }

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
}
