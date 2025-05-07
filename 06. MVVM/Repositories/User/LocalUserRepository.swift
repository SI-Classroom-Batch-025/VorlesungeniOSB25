//
//  LocalUserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 06.05.25.
//

class LocalUserRepository: UserRepository {

    
    
    private var users: [User] = [
        User(id: 1, username: "Admin", password: "123123", name: "Frank", city: "Hamburg")
    ]
    
    func login(username: String, password: String) async -> User? {
        users.first { user in
            user.username.lowercased() == username.lowercased() && user.password == password
        }
    }
    
    func register(username: String, password: String, name: String, city: String) async -> User? {
        if users.contains(where: { user in
            user.username.lowercased() == username.lowercased()
        }) {
            return nil
        } else {
            let user = User(id: users.count + 1, username: username, password: password, name: name, city: city)
            users.append(user)
            return user
        }
    }
    
    func getUserDataByID(_ id: Int) async -> User? {
        users.first { user in
            user.id == id
        }
    }
}
