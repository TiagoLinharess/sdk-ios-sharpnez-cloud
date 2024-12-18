//
//  SHCloudWorker.swift
//  SharpnezCloud
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - SHCloudWorkerProvider

/// Worker Protocol.
public protocol SHCloudWorkerProvider {
    
    // MARK: - Protocol Mehtods
    
    /// Perform request.
    func perform<Response: Decodable>(_ type: Response.Type, request: SHCloudRequestProtocol) async throws -> Response
}

// MARK: - SHCloudWorker

/// Object thats perform request.
public final class SHCloudWorker: NSObject {
    
    // MARK: - Properties
    
    /// Request provider.
    private let apiProvider: SHCloudProviderProtocol
    
    // MARK: - Public Init
    
    /// Initialize.
    public override init() {
        self.apiProvider = SHCloudProvider()
    }
    
    // MARK: - Init
    
    /// Initialize.
    init(apiProvider: SHCloudProviderProtocol = SHCloudProvider()) {
        self.apiProvider = apiProvider
    }
}

extension SHCloudWorker: SHCloudWorkerProvider {
    
    // MARK: - Request
    
    /// Perform request.
    public func perform<Response: Decodable>(_ type: Response.Type, request: SHCloudRequestProtocol) async throws -> Response {
        let data = try await apiProvider.callMethod(request: request)
        let response = try JSONDecoder().decode(Response.self, from: data)
        return response
    }
}
