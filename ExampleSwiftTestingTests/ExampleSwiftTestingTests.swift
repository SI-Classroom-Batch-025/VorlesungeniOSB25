//
//  ExampleSwiftTestingTests.swift
//  ExampleSwiftTestingTests
//
//  Created by Felix B on 19.05.25.
//

import Testing
@testable import ExampleSwiftTesting

struct ExampleSwiftTestingTests {
    
    private var userRepo: LocalUserRepository
    
    init() {
        self.userRepo = LocalUserRepository()
        userRepo.createUser(name: "testuser1")
        userRepo.createUser(name: "testuser2")
        userRepo.createUser(name: "testuser3")
    }

    @Test func getUserTest() async throws {
        let users = userRepo.getUsers()
        #expect(users.count == 3)
    }
    
    @Test func deleteUserTest() async throws {
        userRepo.deleteUser(name: "testuser1")
        let users = userRepo.getUsers()
        #expect(users.count == 2)
    }
    
    @Test func updateUserTest() async throws {
        userRepo.updateUser(oldName: "testuser1", newName: "kevin")
        let users = userRepo.getUsers()
        #expect(users.contains { nameToFind in
            nameToFind == "kevin"
        } && !users.contains { nameToFind in
            nameToFind == "testuser1"
        })
    }

}
