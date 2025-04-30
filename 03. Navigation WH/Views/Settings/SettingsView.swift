//
//  SettingsView.swift
//  03. Navigation
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    
    var colorSelection: [Color] = [
        .yellow,
        .orange,
        .red,
        .blue,
        .green,
        .pink,
        .purple,
        .brown
    ]
    
    @State private var notifications = false
    @State private var soundValue = 0.0
    @State private var showAGBSheet = false
    @State private var showAlert = false
    
    var body: some View {
        Image("pika")
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .clipShape(.circle)
        VStack {
            Text("Profilname")
                .font(.title2)
                .bold()
            Text("Profilmessage dies und das")
                .font(.callout)
        }
        Form {
            Section("General") {
                Toggle(isOn: $notifications) {
                    Text("Pushnachrichten erlauben?")
                }
                .onChange(of: notifications) { oldValue, newValue in
                    if newValue {
                        showAlert = true
                    }
                }
                HStack {
                    Text("\(String(format: "%.0f", soundValue * 100)) %")
                        .frame(width: 50)
                    Slider(value: $soundValue, in: 0...1)
                }
                Button("AGB") {
                    showAGBSheet = true
                }
            }
            
            Section("Backgroundcolors") {
                ForEach($settingsViewModel.backgroundColors, id: \.description) { $color in
                    Picker("Background Color", selection: $color) {
                        ForEach(colorSelection, id: \.description) { selectionColor in
                            Text(selectionColor.description.capitalized).tag(selectionColor)
                        }
                    }
                }
//                Picker("Color1", selection: $colors[0]) {
//                    ForEach(colorSelection, id: \.description) { color in
//                        Text(color.description.capitalized).tag(color)
//                    }
//                }
//                Picker("Color2", selection: $colors[1]) {
//                    ForEach(colorSelection, id: \.description) { color in
//                        Text(color.description.capitalized).tag(color)
//                    }
//                }
//                Picker("Color3", selection: $colors[2]) {
//                    ForEach(colorSelection, id: \.description) { color in
//                        Text(color.description.capitalized).tag(color)
//                    }
//                }
            }
        }
        .alert("Benachrichtigungen", isPresented: $showAlert) {
            Text("Push Benachrichtigungen wurden aktiviert.")
            Button("OK") {
                showAlert = false
            }
        }
        .sheet(isPresented: $showAGBSheet) {
            Text("Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das Lorem ipsum dies und das")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
}
