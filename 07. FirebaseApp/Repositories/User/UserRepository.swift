//
//  UserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

protocol UserRepository {
    func createUser(_ user: AppUser) throws
    func getUserByID(_ id: String) async throws -> AppUser
    func getUserByUsername(_ username: String) async throws -> AppUser
//    func loginUser()
//    func logoutUser()
//    func register()
}
