//
//  Reuseable.swift
//  StackViews
//
//  Created by djiang on 30/08/21.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        String(describing: self)
    }

    override open var description: String {
        var result: String = ""

        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let label = child.label {
                let value = "\(child.value)".replacingOccurrences(of: "Optional(", with: "")
                result += label
                result += "\n"
                result += value
                result += "\n\n"
            }
        }

        return result
    }
}
