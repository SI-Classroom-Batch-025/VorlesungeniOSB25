//
//  UserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 06.05.25.
//

protocol UserRepository {
    func login(username: String, password: String) async -> User?
    func register(username: String, password: String, name: String, city: String) async -> User?
    func getUserDataByID(_ id: Int) async -> User?
}
