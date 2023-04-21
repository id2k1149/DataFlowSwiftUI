//
//  User.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/21/23.
//

import Foundation

struct User: Codable {
    var name = ""
    var isRegistered = false
    
    func updateStatus(for name: String, with status: Bool) {
        StorageManager.shared.usersCurrentStatus["\(name)"] = isRegistered
        }
}
