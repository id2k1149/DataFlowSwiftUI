//
//  ContentView.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        VStack {
            Text("Hi, \(username)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
//            ButtonView(timer: timer)
            ButtonView(title: "Start",
                       timer: timer,
                       user: user)
            Spacer()
            ButtonView(title: "LogOut",
                       timer: timer,
                       user: user)
            
//            LogoutButtonView(user: user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    var title: String
    @ObservedObject var timer: TimeCounter
    @ObservedObject var user: UserManager
    @Environment(\.presentationMode) var presentationMode
    
    @State var counter = 0
    
    var body: some View {
        Button(action: {
            switch title {
            case "LogOut":
                self.logout()
            default:
                self.timer.startTimer()
            }
        })  {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(title == "LogOut" ? .blue : .red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        )
    }
    
    private func logout() {
        user.isRegisted = false
        UserDefaults.standard.removeObject(forKey: "username")
        presentationMode.wrappedValue.dismiss()
    }
}


/*
struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        )
    }
}
 */
