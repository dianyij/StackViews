//
//  Debouncer.swift
//  TMHelpers
//
//  Created by djiang on 12/07/21.
//  Copyright © 2021 Trade Me Ltd. All rights reserved.
//

import Foundation

@available(iOS 10, *)
public class Debouncer {
    public static let shared = Debouncer()

    private var defalutTimeInterval: TimeInterval
    private weak var timer: Timer?

    public init(timeInterval: TimeInterval = 0.5) {
        self.defalutTimeInterval = timeInterval
    }

    public func run(timeInterval: TimeInterval? = nil, _ callback: @escaping (() -> Void)) {
        let dueTime = timeInterval ?? defalutTimeInterval
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: dueTime, repeats: false) { _ in
            callback()
        }
    }
}
