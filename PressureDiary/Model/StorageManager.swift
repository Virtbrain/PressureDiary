//
//  StorageManager.swift
//  PressureDiary
//
//  Created by Alexey Manankov on 18.08.2023.
//

import Foundation

//MARK: - Protocol CRUD
protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)
    
    func array(forKey key: StorageManager.Keys) -> Array<Any>?
}

final class StorageManager {
    
    public enum Keys: String {
        case pressureDiaryData
    }
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}

//MARK: - Extension StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func array(forKey key: Keys) -> Array<Any>? {
        restore(forKey: key.rawValue) as? Array<Any>
    }
}
