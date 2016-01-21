//
//  Exceptions.swift
//  ELFoundation
//
//  Created by Brandon Sneed on 2/19/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

/**
The name of the exception thrown by 'exceptionFailture(...)'.
*/
public let THGExceptionFailure = "THGExceptionFailure"

/**
This function is intended to be used to catch programming errors and undefined code
paths.  To handle unrecoverable errors, see 'assertionFailure'.

Raises an exception and can be used on testable code.  This is to be used as an 
alternative to assertionFailure(), which blows up tests.

- parameter message: Message string to be used.

Example:  exceptionFailure("This object is invalid.  \(obj)")
*/
public func exceptionFailure(message: String) {
    if isInUnitTest() {
        NSException.raise(THGExceptionFailure, format: message, arguments: CVaListPointer(_fromUnsafeMutablePointer: nil))
        //NSException.raise("ELFoundationExceptionFailure", format: format, arguments: nil)
    } else {
        #if DEBUG
        NSException.raise(THGExceptionFailure, format: message, arguments: CVaListPointer(_fromUnsafeMutablePointer: nil))
        #endif
    }
}