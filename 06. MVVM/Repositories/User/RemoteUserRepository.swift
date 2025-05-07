//
//  RemoteUserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 06.05.25.
//

class RemoteUserRepository: UserRepository {
    func login(username: String, password: String) async -> User? {
        return nil
    }
    
    func register(username: String, password: String, name: String, city: String) async -> User? {
        return nil
    }
    
    func getUserDataByID(_ id: Int) async -> User? {
        return nil
    }
}
