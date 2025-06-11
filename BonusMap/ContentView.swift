//
//  ContentView.swift
//  BonusMap
//
//  Created by Felix B on 10.06.25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
//    @State var marker: [MarkerModel] = [
//        .init(name: "Test1", coords: .init(latitude: 44.236, longitude: 8.22)),
//        .init(name: "Test2", coords: .init(latitude: 44.232, longitude: 8.22))
//    ]
//    
    @StateObject var mapViewModel = MapViewModel()
    
    var body: some View {
        HStack {
            TextField("Suche", text: $mapViewModel.searchTerm)
            Button("GO!") {
                mapViewModel.markLocation()
            }
        }
        .padding()
        
        HStack {
            TextField("Von", text: $mapViewModel.origin)
            TextField("Zu", text: $mapViewModel.destination)
            Button("Route") {
                mapViewModel.calculateRoute()
            }
        }
        .padding()
        Map(position: $mapViewModel.position) {
            ForEach(mapViewModel.markers) { marker in
                 Marker(marker.name, coordinate: marker.coords)
//                Annotation(marker.name, coordinate: marker.coords) {
//                    Image(systemName: "globe")
//                }
            }
            
            if let route = mapViewModel.route {
                MapPolyline(route.polyline)
                    .stroke(.red, lineWidth: 5)
            }
        }
        // .standard = simple Map mit vielen Infos
        // .imagary = detailierte Map mit keinen Infos
        // .hybrid = detailierte Map mit vielen Infos
        .mapStyle(.standard)
        .mapControls {
            MapScaleView() // Zeigt beim zoomen das Zoomlevel an
            MapCompass() // Zeigt die Rotation an und bietet eine einfache möglichkeit sich wieder nach Norden auszurichten
            MapUserLocationButton() // Findet die aktuelle Position des Nutzers
            MapPitchToggle() // Bietet eine einfache Möglichkeit für den Wechsel von 2D zu 3D und umgekehrt
        }
    }
}

#Preview {
    ContentView()
}
