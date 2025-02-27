//
//  SHCloudRequest.swift
//  SharpnezCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - SHCloudRequestProtocol

/// SHCloudRequest protocol.
public protocol SHCloudRequestProtocol: Sendable {
    
    // MARK: - Protocol Properties
    
    /// Endpoint path.
    var endpoint: String { get }
    
    /// HTTP Method.
    var method: SHCloudHTTPMethod { get }
    
    /// Request Headers.
    var headers: [String: String]? { get }
    
    /// Request query params.
    var requestParams: [URLQueryItem]? { get }
    
    /// Request body.
    var requestBody: Data? { get }
}

// MARK: - SHCloudRequest

/// SHCloudRequest object.
public struct SHCloudRequest<T: Encodable>: SHCloudRequestProtocol {
    
    // MARK: - Public Properties
    
    /// Endpoint path.
    public let endpoint: String
    
    /// HTTP Method.
    public let method: SHCloudHTTPMethod
    
    /// Request Headers.
    public let headers: [String: String]?
    
    /// Request query params.
    public let requestParams: [URLQueryItem]?
    
    /// Request body.
    public let requestBody: Data?
    
    // MARK: - Init
    
    public init(method: SHCloudHTTPMethod, endpoint: String, headers: [String: String]?, data: T?) {
        let requestData = try? JSONEncoder().encode(data)
        
        self.method = method
        self.endpoint = endpoint
        self.headers = headers
        self.requestParams = SHCloudParams.getUrlParamsFromData(data: requestData)
        self.requestBody = requestData
    }
}
