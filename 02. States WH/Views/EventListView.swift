//
//  EventListView.swift
//  02. States WH
//
//  Created by Felix B on 21.03.25.
//

import SwiftUI

struct EventListView: View {
    
    @State private var events: [Event] = [
        Event(name: "Rise Against", date: .now, location: "Hamburg", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .concert),
        Event(name: "Linkin Park", date: .now, location: "Lübeck", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .concert),
        Event(name: "Tanz in den Mai", date: .now, location: "München", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .party),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
    ]
    
    @State private var filterType: EventType? = nil
    @State private var searchText: String = ""
    @State private var showAddView = false
    
    @State private var eventName = ""
    @State private var eventDate: Date = .now
    @State private var eventLocation = ""
    @State private var eventDescription = ""
    @State private var eventType: EventType = .concert
    
    @State private var showAsGrid = false
    
    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]
    
    var filteredEvents: [Event] {
        events.filter { event in
            (filterType == nil ? true : event.type == filterType)
            && (searchText.isEmpty ? true : event.name.lowercased().contains(searchText.lowercased()))
        }
    }
    
    var body: some View {
        HStack {
            TextField("Suche nach Eventname...", text: $searchText)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Picker("Select Eventtype", selection: $filterType) {
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
                    ForEach(filteredEvents) { event in
                        EventItemView(event: event) {
                            events.removeAll { eventToRemove in
                                eventToRemove.id == event.id
                            }
                        }
                    }
                }
            } else {
                ForEach(filteredEvents) { event in
                    EventItemView(event: event) {
                        events.removeAll { eventToRemove in
                            eventToRemove.id == event.id
                        }
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .overlay {
            if showAddView {
                VStack {
                    Button("Schließen") {
                        showAddView = false
                    }
                    TextField("Event Name", text: $eventName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Ort", text: $eventLocation)
                        .textFieldStyle(.roundedBorder)
                    TextField("Beschreibung", text: $eventDescription)
                        .textFieldStyle(.roundedBorder)
                    Picker("Typ auswählen", selection: $eventType) {
                        ForEach(EventType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    DatePicker("Datum auswählen", selection: $eventDate, displayedComponents: .date)
                    Button("Add") {
                        let newEvent = Event(name: eventName, date: eventDate, location: eventLocation, description: eventDescription, type: eventType)
                        events.append(newEvent)
                        eventName = ""
                        eventLocation = ""
                        eventDescription = ""
                        eventType = .concert
                        eventDate = .now
                        showAddView = false
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
                showAddView = true
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
