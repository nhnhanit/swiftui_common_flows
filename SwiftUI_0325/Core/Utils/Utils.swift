//
//  Utils.swift
//  SwiftUI_0325
//
//  Created by hongnhan on 24/4/25.
//

// Debug Print Log
// USAGE:
// Dlog(self.variabel)
public func DLog<T>(_ object: @autoclosure () -> T) {
#if DEBUG
    let value = object()
    print(value)
#endif
}

// Dlog("somethings to print", self.variabel)
public func DLog<T>(_ string: String, _ object: @autoclosure () -> T) {
#if DEBUG
    let valueString = string
    let value = object()
    print(valueString)
    print(value)
#endif
}
