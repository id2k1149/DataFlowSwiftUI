//
//  RegisterView.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import SwiftUI

struct RegisterView: View {
//    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $username)
                .multilineTextAlignment(.center)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    
    private func registerUser() {
        if !username.isEmpty {
            user.name = username
            user.isRegisted = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
