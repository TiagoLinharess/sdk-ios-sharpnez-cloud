//
//  SampleApp.swift
//  Sample
//
//  Created by Tiago Linhares on 18/12/24.
//

import SharpnezCloud
import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    SDKCloudConfiguration.shared.baseUrl = "https://1y60o.wiremockapi.cloud"
                }
        }
    }
}
