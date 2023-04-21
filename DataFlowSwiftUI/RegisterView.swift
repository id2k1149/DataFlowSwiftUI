//
//  RegisterView.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                
                UserNameTFView(name: $userManager.user.name)
                
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                    .font(.title)
                }
                .disabled(userManager.user.name.count < 3)
                .frame(width: 140, height: 60)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.white, lineWidth: 4))
            }
        }
    }
    
    private func registerUser() {
        userManager.user.isRegistered = true
        userManager.user.updateStatus(
            for: userManager.user.name,
            with: userManager.user.isRegistered)
        StorageManager.shared.save(userStatus: StorageManager.shared.usersCurrentStatus)
        print(StorageManager.shared.getUsersCurrentStatus())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

struct UserNameTFView: View {
    @Binding var name: String
    
    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .frame(width: 300, height: 40)
                .font(.title)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .background(Color.white)
                .bold()
                .cornerRadius(8)
            
            Text("\(name.count)")
                .frame(width: 40, height: 40)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.white)
                .font(.title)
                .bold()
                .foregroundColor(name.count > 2 ? .green : .red)
                .cornerRadius(8)
        }
    }
}
