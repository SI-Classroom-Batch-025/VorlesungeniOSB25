//
//  MapViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 11.06.25.
//

import SwiftUI
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var searchTerm: String = ""
    @Published var origin: String = ""
    @Published var destination: String = ""
    @Published var markers: [MarkerModel] = []
    @Published var position: MapCameraPosition = .automatic
    @Published var route: MKRoute?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        requestLocation()
    }
    
    func requestLocation() {
        // Wir fragen den Nutzer nach Erlaubnis, die Standortdaten zu benutzen
        locationManager.requestWhenInUseAuthorization()
        // FALLS der Nutzer dem Nutzen der Standortdaten zugestimmt hat, dann aktualiseren wir die Daten im Hintergrund
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates = locations.last?.coordinate else { return }
        setCamera(coordinates)
    }
    
    func calculateRoute() {
        Task {
            do {
                // Wir holen uns die coordinaten von unseren Startort
                let originCoordinates = try await getCoordinates(for: origin)
                // Wir holen uns die coordinaten von unseren Zielort
                let destinationCoordinates = try await getCoordinates(for: destination)
                // Erstellen einen DirectionsRequst
                let request = MKDirections.Request()
                // Setzen den Startpunkt unseres Requests auf den Startort
                request.source = MKMapItem(placemark: .init(coordinate: originCoordinates))
                // Setzen den Zielpunkt unseres Requests auf den Zielort
                request.destination = MKMapItem(placemark: .init(coordinate: destinationCoordinates))
                // Geben an wie wir die Route beschreiten wollen
                request.transportType = .automobile
                
                let directions = MKDirections(request: request)
                let route = try await directions.calculate().routes.first
                self.route = route
                let center = CLLocationCoordinate2D(
                    latitude: (originCoordinates.latitude + destinationCoordinates.latitude) / 2,
                    longitude: (originCoordinates.longitude + destinationCoordinates.longitude) / 2
                )
                self.position = .region(
                    .init(
                        center: center,
                        // Span gibt das zoomlevel an
                        span: .init(
                            latitudeDelta: (route?.distance.magnitude ?? 60000) / 60000,
                            longitudeDelta: (route?.distance.magnitude ?? 60000) / 60000
                        )
                    )
                )
            } catch {
                print(error)
            }
        }
    }
    
    @MainActor
    func markLocation() {
        Task {
            do {
                // Versuchen die coordinaten, für die Suche zu finden
                let coordinates = try await getCoordinates(for: searchTerm)
                // Marker basierend auf den coordinaten erstellen
                let marker = MarkerModel(name: searchTerm, coords: coordinates)
                // Marker zu unseren markers hinzufügen
                self.markers.append(marker)
                // Setzen die Kamera auf die neue gefundene Position
                setCamera(coordinates)
            } catch {
                print(error)
            }
        }
    }
    
    private func getCoordinates(for searchTerm: String) async throws -> CLLocationCoordinate2D {
        // Coordinaten für einen bestimmten Ort herausfinden
        let place = try await CLGeocoder().geocodeAddressString(searchTerm).first
        // Falls nichts gefunden wurde abbrechen
        guard let coordinates = place?.location?.coordinate else {
            throw MapError.placeNotFound
        }
        return coordinates
    }
    
    private func setCamera(_ coordinates: CLLocationCoordinate2D) {
        self.position = .region(
            .init(
                center: coordinates,
                // Span gibt das zoomlevel an
                span: .init(
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            )
        )
    }
}

enum MapError: Error {
    case placeNotFound
}
