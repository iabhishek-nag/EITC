//
//  IdentifierProtocol.swift
//  EITC
//
//  Created by Abhishek Singh on 12/07/23.
//

import Foundation

protocol IdentifierProtocol {
    static func identifier() -> String
}

extension IdentifierProtocol {
    static func identifier() -> String {
        return String(describing: self)
    }
}
