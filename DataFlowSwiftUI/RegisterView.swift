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
    @State private var isUsernameValid = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $username)
                    .multilineTextAlignment(.center)
                    .onChange(of: username) { newValue in
                        isUsernameValid = (newValue.count > 2)
                    }
                
                Text("\(username.count)")
                    .padding(.trailing, 16)
                    .foregroundColor(isUsernameValid ? .green : .red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!isUsernameValid)
        }
    }
    
    private func registerUser() {
        user.name = username
        user.isRegisted = true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
