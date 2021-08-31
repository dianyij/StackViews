//
//  NSObjectExts.swift
//  StackViews
//
//  Created by djiang on 31/08/21.
//

import Foundation

func dlog(file: String = #file, line: Int = #line, function: String = #function) {
    #if !RELEASE
    let filename = file.split(separator: "/").map(String.init).last?.split(separator: ".").map(String.init).first ?? file
    print("🟨 \(filename):\(line) 🚦 \(function)")
    #endif
}

extension NSObject {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
