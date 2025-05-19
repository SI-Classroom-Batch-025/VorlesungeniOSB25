//
//  LocalUserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 19.05.25.
//

class LocalUserRepository {
    
    private var users: [String] = []
    
    func createUser(name: String) {
        users.append(name)
    }
    
    func getUsers() -> [String] {
        return users
    }
    
    func updateUser(oldName: String, newName: String) {
        let index = users.firstIndex(of: oldName)
        guard let index else { return }
        users[index] = newName
    }
    
    func deleteUser(name: String) {
        users.removeAll { userToRemove in
            userToRemove == name
        }
    }
}
