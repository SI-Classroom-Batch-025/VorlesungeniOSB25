//
//  MarkerModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 11.06.25.
//

import Foundation
import MapKit

struct MarkerModel: Identifiable {
    var id = UUID()
    var name: String
    var coords: CLLocationCoordinate2D
}
