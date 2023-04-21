//
//  StorageManager.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/20/23.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    var usersCurrentStatus = [String: Bool]()
    
    @AppStorage("usersCurrentStatus") private var usersData: Data?
    
    private init(){}
    
    func save(userStatus: [String: Bool]) {
        usersData = try? JSONEncoder().encode(userStatus)
    }
    
    func getUsersCurrentStatus() -> [String: Bool] {
        let emptyDictionary = [String: Bool]()
        guard
            let usersStatusDictionary = try? JSONDecoder().decode([String: Bool].self, from: usersData ?? Data())
        else {return emptyDictionary}
        return usersStatusDictionary
    }
    
    func logout(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.updateStatus(for: userManager.user.name, with: false)
        save(userStatus: usersCurrentStatus)
        userManager.user.name = ""
    }
}

