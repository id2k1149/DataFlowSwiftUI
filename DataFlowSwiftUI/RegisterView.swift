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
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    TextField("Enter your name", text: $username)
                        .frame(width: 300, height: 40)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .background(Color.white)
                        .bold()
                        .cornerRadius(8)
                    
                    Text("\(username.count)")
                        .frame(width: 40, height: 40)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .background(Color.white)
                        .font(.title)
                        .bold()
                        .foregroundColor(username.count > 2 ? .green : .red)
                        .cornerRadius(8)
                }
                .padding()
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                    .font(.title)
                }
                .disabled(username.count < 3)
                .frame(width: 140, height: 60)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
            }
        }
    }
    
    private func registerUser() {
        user.name = username
        user.isRegisted = true
        user.updateStatus(for: username, with: user.isRegisted)
        user.printCurrentStatus()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
