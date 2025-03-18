//
//  UserListVIew.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct UserListView: View {
    
    let users: [AppUser] = [
        AppUser(username: "username1", joinedChats: []),
        AppUser(username: "username2", joinedChats: []),
        AppUser(username: "username3", joinedChats: []),
        AppUser(username: "username4", joinedChats: []),
        AppUser(username: "username5", joinedChats: []),
        AppUser(username: "username6", joinedChats: []),
        AppUser(username: "username7", joinedChats: []),
        AppUser(username: "username8", joinedChats: []),
    ]
    
    var body: some View {
        ForEach(users) { user in // id: muss nicht angegeben werden, da AppUser identifiable ist
            HStack {
                Text(user.id)
                Text(user.username)
            }
        }
    }
}

#Preview {
    UserListView()
}
