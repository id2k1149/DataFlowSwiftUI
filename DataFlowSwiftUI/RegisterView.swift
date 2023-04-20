//
//  RegisterView.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var user: UserManager
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $username)
                    .multilineTextAlignment(.center)
                Text("\(username.count)")
                    .padding(.trailing, 16)
                    .foregroundColor(username.count < 3 ? .red : .green)
            }
            Button(action: {
                if username.count > 2 {
                    self.registerUser()
                }
            }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(username.count < 3 ? .red : .green)
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
