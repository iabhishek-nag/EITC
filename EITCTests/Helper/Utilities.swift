//
//  Utilities.swift
//  EITCTests
//
//  Created by Abhishek Singh on 16/07/23.
//

import Foundation

struct Utilities {
    // Codable helper
    static func readJSON<T: Decodable>(_ fileName: String, type: T.Type) -> T? {
        let testBundle = Bundle(for: LoginViewModelTest.self)
        if let url = testBundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error: \(error)")
                return nil
            }
        }
        return nil
    }

}
