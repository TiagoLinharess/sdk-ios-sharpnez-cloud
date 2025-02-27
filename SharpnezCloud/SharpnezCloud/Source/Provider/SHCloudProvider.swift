//
//  ApiProvider.swift
//  SharpnezCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - SHCloudProviderProtocol

/// SHCloudProvider Protocol.
public protocol SHCloudProviderProtocol {
    
    /// Perform HTTP request provider.
    func callMethod(request: SHCloudRequestProtocol) async throws -> Data
}

// MARK: - SHCloudProvider

/// SHCloudProvider.
public final class SHCloudProvider {
    
    // MARK: - Public Init
    
    /// Initialize provider.
    public init() {}
}

extension SHCloudProvider: SHCloudProviderProtocol {
    
    // MARK: - Provider Request
    
    /// Perform HTTP request provider.
    @MainActor
    public func callMethod(request: SHCloudRequestProtocol) async throws -> Data {
        let urlRequest = try getURL(request: request)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw SHCloudError.customError(CloudConstants.Provider.noResponseFromServer)
        }
        
        guard statusCode >= CloudConstants.Provider.successStatusCode &&
              statusCode < CloudConstants.Provider.errorStatusCode
        else { throw SHCloudError.httpError(data, statusCode) }
        
        return data
    }
}

private extension SHCloudProvider {
    
    // MARK: - Build URL
    
    /// Get URL request
    @MainActor
    func getURL(request: SHCloudRequestProtocol) throws -> URLRequest {
        guard let urlString = SHCloudConfiguration.shared?.getBaseURL(),
              let url = URL(string: urlString + request.endpoint)
        else {
            throw SHCloudError.customError(CloudConstants.Provider.noAvailableURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        request.headers?.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if request.method != .get {
            urlRequest.httpBody = request.requestBody
        } else {
            urlRequest.url?.append(queryItems: request.requestParams ?? [])
        }
        
        return urlRequest
    }
}
