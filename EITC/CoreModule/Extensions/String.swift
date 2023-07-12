import Foundation

extension String {
    var isValidEmail: Bool {
        // swiftlint:disable:next line_length
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    var isValidMobileNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }

    var numbers: String {
        return self.filter("01234567890.".contains)
    }

    var isAlphaNumeric: Bool {
        let formatePre = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{7,}$"
        let resultPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", formatePre)
        return resultPredicate.evaluate(with: self)
    }

    var integer: Int? {
        if let float = float {
            return Int(float)
        } else {
            return Int(self)
        }
    }

    var float: Float? {
        return Float(self)
    }

}
