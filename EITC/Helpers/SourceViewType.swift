//
//  SourceViewType.swift
//  EITC
//
//  Created by Abhishek Singh on 19/07/23.
//

import UIKit

//sourcery: AutoMockable
protocol SourceViewType {
    var presentingView: SourceViewType? { get }
    var presentedView: SourceViewType? { get }
    var navigationView: SourceViewType? { get }

    func push(_ view: SourceViewType, animated: Bool)
    func pop(animated: Bool)
    func pop(to source: SourceViewType)
    func popToRoot(animated: Bool)
    func present(_ view: SourceViewType, animated flag: Bool, completion: (() -> Void)?)
    func setRoot(viewController: UIViewController)

    func handleError(_ error: Error)
    func presentAlert(title: String?, message: String?)
    func presentAlert(title: String?,
                      message: String?,
                      dismissTitle: String?,
                      dismissAction: (() -> Void)?)

    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension SourceViewType {
    var presentingView: SourceViewType? { return nil }
    var presentedView: SourceViewType? { return nil }
    var navigationView: SourceViewType? { return nil }

    func dismiss(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
}

extension UIViewController: SourceViewType {

    var controller: UIViewController { return self }
    var presentingView: SourceViewType? {
        return presentingViewController ?? navigationController?.presentingViewController
    }
    var presentedView: SourceViewType? {
        return presentedViewController ?? navigationController?.presentedViewController
    }
    var navigationView: SourceViewType? {
        return navigationController ?? parent?.navigationView
    }

    func push(_ view: SourceViewType, animated: Bool) {
        guard let viewController = view as? UIViewController else {
            return
        }
        let nav = (self as? UINavigationController) ?? self.navigationController
        nav?.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool) {
        let nav = (self as? UINavigationController) ?? self.navigationController
        _ = nav?.popViewController(animated: animated)
    }

    func pop(to source: SourceViewType) {
        guard let controller = source as? UIViewController else {
            fatalError("Controller not found")
        }
        let nav = (self as? UINavigationController) ?? self.navigationController
        _ = nav?.popToViewController(controller, animated: true)
    }

    func popToRoot(animated: Bool) {
        let nav = (self as? UINavigationController) ?? self.navigationController
        _ = nav?.popToRootViewController(animated: animated)
    }

    func present(_ view: SourceViewType, animated flag: Bool, completion: (() -> Void)?) {
        let source = tabBarController ?? navigationController ?? self
        guard let viewController = view as? UIViewController else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            source.present(viewController, animated: flag, completion: completion)
        }
    }

    func setRoot(viewController: UIViewController) {
        self.view.window?.rootViewController = viewController
    }

    func handleError(_ error: Error) {
        var errorMessage = error.localizedDescription
        if let errorResponse = error as? ErrorResponse {
            errorMessage = errorResponse.statusMessage
        }
        presentAlert(title: "Error!", message: errorMessage)
    }

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
