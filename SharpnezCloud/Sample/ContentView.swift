//
//  ContentView.swift
//  Sample
//
//  Created by Tiago Linhares on 18/12/24.
//

import SharpnezCloud
import SwiftUI

struct Response: Decodable {
    let success: Bool
}

struct Request: Encodable {
    let name = "Jhon Doe"
    let email = "a@a.com"
    let password = "NJBAHBABSvxhbsjwbUBAJBj"
}

struct ContentView: View {
    
    @State var isLoading: Bool = false
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await makeRequest()
                }
            } label: {
                Text("Make Request")
            }

            
            if isLoading {
                Text("Loading...")
            } else {
                Text(message)
            }
        }
        .padding()
    }
    
    private func makeRequest() async {
        let worker = SHCloudWorker()
        let request = SHCloudRequest(
            method: .post,
            endpoint: "/user/create",
            headers: ["apiKey": "7690a974-2a7b-48bb-8a01-97aec5b5e89d"],
            data: Request()
        )
        
        do {
            let response = try await worker.perform(Response.self, request: request)
            message = response.success ? "Success" : "No Success"
        } catch {
            message = "Error \(error)"
        }
    }
}
