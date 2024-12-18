//
//  SHCloudError.swift
//  SharpnezCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - Api Error

public enum SHCloudError: Error {
    
    /// Generic Error.
    /// message value: SharpnezCloud.SHCloudError error 2.
    case genericError
    
    /// HTTP Error.
    /// Params: (Data, Int).
    /// message value: SharpnezCloud.ApiError error 0.
    case httpError(Data, Int)
    
    /// HTTP Error.
    /// Params: (String).
    /// message value: param String value.
    case customError(String)
    
    // MARK: - Public Properties
    
    /// SHCloudError Message.
    public var message: String {
        switch self {
        case .genericError, .httpError(_, _):
            return localizedDescription
        case .customError(let string):
            return string
        }
    }
}
