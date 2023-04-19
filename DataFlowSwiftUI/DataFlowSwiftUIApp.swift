//
//  DataFlowSwiftUIApp.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import SwiftUI

@main
struct DataFlowSwiftUIApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
