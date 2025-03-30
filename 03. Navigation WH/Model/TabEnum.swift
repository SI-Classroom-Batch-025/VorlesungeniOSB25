//
//  TabEnunm.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

enum TabItem: String, CaseIterable, Identifiable {
    case chat = "Chat"
    case settings = "Einstellungen"
    
    var image: String {
        switch self {
        case .chat:
            "bubble"
        case .settings:
            "wrench"
        }
    }
    var id: TabItem {
        self
    }
    
//    @ViewBuilder
//    var destination: some View {
//        switch self {
//        case .chat:
//            ChatListView()
//        case .settings:
//            SettingsView()
//        }
//    }
}
