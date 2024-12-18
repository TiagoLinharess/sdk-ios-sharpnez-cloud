//
//  SHCloudConfiguration.swift
//  SDKCore
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

// MARK: - SHCloudConfiguration

/// SHCloud main Configuration.
public final class SHCloudConfiguration: NSObject {
    
    // MARK: - Properties
    
    /// SHCloud Singleton.
    public static var shared: SHCloudConfiguration?
    
    /// This property is used to create the URL for request.
    /// This is not opcional don't use it when using SharpnezCloud.
    /// Don't using it will return this error "SHCloudError.customError("No Available URL")".
    var baseURL: String?
    
    // MARK: - Start
    
    /// Start Singleton Method
    public class func start(baseURL: String) {
        shared = SHCloudConfiguration()
        shared?.baseURL = baseURL
    }
    
    // MARK: - Get baseURL
    
    public func getBaseURL() -> String? {
        return baseURL
    }
}
