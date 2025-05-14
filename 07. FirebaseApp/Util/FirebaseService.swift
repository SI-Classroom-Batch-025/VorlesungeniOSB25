//
//  FirebaseService.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

import FirebaseAuth
import FirebaseFirestore

class FirebaseService {
    static let instance = FirebaseService()
    private init() {}
    
    let auth = Auth.auth()
    let databse = Firestore.firestore()
    
    var userID: String? {
        auth.currentUser?.uid
    }
}
