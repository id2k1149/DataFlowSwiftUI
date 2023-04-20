//
//  UserManager.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/19/23.
//

import Foundation

final class UserManager: ObservableObject {
    let storageManager = StorageManager.shared
    
    @Published var isRegisted = false
    var name = ""
    
    func add(name: String) {
        if !storageManager.names.contains(name) {
            storageManager.names.append(name)
        }
    }
}
