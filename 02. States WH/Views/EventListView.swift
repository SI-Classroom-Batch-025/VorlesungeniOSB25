//
//  EventListView.swift
//  02. States WH
//
//  Created by Felix B on 21.03.25.
//

import SwiftUI

struct EventListView: View {
    
    @StateObject private var eventViewModel = EventViewModel()
    @State private var showAsGrid = false

    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]
    
    var body: some View {
        HStack {
            TextField("Suche nach Eventname...", text: $eventViewModel.searchText)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Picker("Select Eventtype", selection: $eventViewModel.filterType) {
                Text("Alle").tag(nil as EventType?)
                ForEach(EventType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }

        }
        .padding()
        .background(.gray.mix(with: .white, by: 0.5))
        
        ScrollView {
            if showAsGrid {
                LazyVGrid(columns: columns) {
                    ForEach(eventViewModel.filteredEvents) { event in
                        EventItemView(event: event) {
                            eventViewModel.removeEvent(event: event)
                        }
                    }
                }
            } else {
                ForEach(eventViewModel.filteredEvents) { event in
                    EventItemView(event: event) {
                        eventViewModel.removeEvent(event: event)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .overlay {
            if eventViewModel.showAddView {
                VStack {
                    Button("Schließen") {
                        eventViewModel.showAddView = false
                    }
                    
                    TextField("Event Name", text: $eventViewModel.eventName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Ort", text: $eventViewModel.eventLocation)
                        .textFieldStyle(.roundedBorder)
                    TextField("Beschreibung", text: $eventViewModel.eventDescription)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("Typ auswählen", selection: $eventViewModel.eventType) {
                        ForEach(EventType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    
                    DatePicker("Datum auswählen", selection: $eventViewModel.eventDate, displayedComponents: .date)
                    
                    Button("Add") {
                        eventViewModel.createNewEvent()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(.gray.mix(with: .white, by: 0.5))
            }
        }
        HStack {
            Button(showAsGrid ? "Listenanzeige" : "Gitteranzeige") {
                showAsGrid.toggle()
            }
            Button("Hinzufügen") {
                eventViewModel.showAddView = true
            }
        }
        
        
        
        /*
         
         List ist sehr nach an einer Scrollview + LazyVStack + ForEach
         List ist dazu noch vorgestyled, und bietet uns einige weitere modifier die wir auf die Liste anwenden können
         
         
         
         */
    }
}

#Preview {
    EventListView()
}
