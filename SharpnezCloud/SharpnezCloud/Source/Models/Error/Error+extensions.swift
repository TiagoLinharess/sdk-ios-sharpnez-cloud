//
//  Error+extensions.swift
//  SharpnezCloud
//
//  Created by Tiago Linhares on 05/07/23.
//

import Foundation

// MARK: - Error extension

extension Error {
    
    // MARK: - Public Properties
    
    /// Creates a defaul SHCloudError.
    public var defaultApiError: SHCloudError {
        .customError(CloudConstants.Error.defaultMessage)
    }
    
    // MARK: - Public Methods
    
    /// Returns a SHCloudErrorResponse.
    /// If SHCloudErrorResponse generic type is not valid, response is going to be nil.
    public func parseError<T: Decodable>(_ type: T.Type) -> SHCloudErrorResponse<T> {
        guard let response = try? getHttpResponse(T.self) else {
            return SHCloudErrorResponse(
                response: nil,
                defaultMessage: defaultApiError.message,
                statusCode: nil
            )
        }
        
        return response
    }
    
    // MARK: - Private Mehtods
    
    /// Transform Error in HttpErrorResponse.
    private func getHttpResponse<T: Decodable>(_ type: T.Type) throws -> SHCloudErrorResponse<T> {
        let apiError = self as? SHCloudError ?? defaultApiError
        switch apiError {
        case .httpError(let data, let statusCode):
            let response = try JSONDecoder().decode(T.self, from: data)
            return SHCloudErrorResponse<T>(response: response, defaultMessage: defaultApiError.message, statusCode: statusCode)
        default:
            break
        }
        throw defaultApiError
    }
}
