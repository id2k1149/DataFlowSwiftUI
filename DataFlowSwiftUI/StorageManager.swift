//
//  StorageManager.swift
//  DataFlowSwiftUI
//
//  Created by Max Franz Immelmann on 4/20/23.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    var names = ["John", "Paul"]
    
    private init(){}
}
