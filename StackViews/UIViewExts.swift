//
//  UIViewExts.swift
//  StackViews
//
//  Created by djiang on 30/08/21.
//

import UIKit

extension UIView {
    open var properties: String {
        let seperator = "⛔️⛔️⛔️\n"

        var result: String = seperator

        let mirror = Mirror(reflecting: self)
        let children = mirror.children.sorted { $0.label! < $1.label! }
        for child in children {
            if let label = child.label {
                let value = "\(child.value)".replacingOccurrences(of: "Optional(", with: "")
                result += "🔑 " + label + "\n"
                guard value != "\(seperator))" else { continue }
                result += "-> " + value + "\n"
            }
        }

        return result
    }
}
