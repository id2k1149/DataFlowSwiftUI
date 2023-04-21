//
//  UserManager.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var user = User()
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}
