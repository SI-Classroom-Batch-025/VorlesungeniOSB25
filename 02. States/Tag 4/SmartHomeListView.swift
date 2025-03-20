//
//  SmartHomelist.swift
//  02. States
//
//  Created by Felix B on 20.03.25.
//

import SwiftUI

struct SmartDevice: Identifiable {
    var name: String
    var id = UUID()
    var type: SmartDeviceType
}

enum SmartDeviceType {
    case light, thermo, door
}

struct SmartHomeListView: View {
    
    var smartDevices = [
        SmartDevice(name: "Test1", type: .light),
        SmartDevice(name: "Test2", type: .door),
        SmartDevice(name: "Test3", type: .light),
        SmartDevice(name: "Test4", type: .thermo),
        SmartDevice(name: "Test5", type: .thermo),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(smartDevices) { device in
                    ListElement(device: device)
                }
            }
        }
    }
}
    
struct ListElement: View {
    
    var device: SmartDevice
    @State var toggleValue = false
    @State var sliderValue = 20.0
    
    var body: some View {
        VStack {
            Text(device.name)
            switch(device.type) {
            case .door:
                Toggle("Tür auf?", isOn: $toggleValue)
            case .light:
                Toggle("Licht an?", isOn: $toggleValue)
            case .thermo:
                Slider(value: $sliderValue, in: 10...30)
            }
        }
    }
}

#Preview {
    SmartHomeListView()
}
