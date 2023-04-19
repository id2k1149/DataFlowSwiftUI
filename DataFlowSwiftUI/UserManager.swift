//
//  UserManager.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var isRegisted = false
    var name = ""
}
