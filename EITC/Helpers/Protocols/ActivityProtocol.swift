//
//  ProgressHudProtocol.swift
//  EITC
//
//  Created by Abhishek Singh on 21/07/23.
//

import Foundation
import ProgressHUD

protocol ActivityProtocol {
    func showLoader()
    func hideLoader()
}

extension ActivityProtocol {
    func showLoader() {
        ProgressHUD.show()
    }

    func hideLoader() {
        ProgressHUD.dismiss()
    }
}
