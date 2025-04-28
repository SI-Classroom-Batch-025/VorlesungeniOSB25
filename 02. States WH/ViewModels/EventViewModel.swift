//
//  EventViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 28.04.25.
//

import SwiftUI

@MainActor
class EventViewModel: ObservableObject {
    @Published var events: [Event] = [
        Event(name: "Rise Against", date: .now, location: "Hamburg", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .concert),
        Event(name: "Linkin Park", date: .now, location: "Lübeck", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .concert),
        Event(name: "Tanz in den Mai", date: .now, location: "München", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .party),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
        Event(name: "Dokomi", date: .now, location: "Bochum", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .convention),
    ]
    
    @Published var filterType: EventType? = nil
    @Published var searchText: String = ""
    @Published var showAddView = false
    
    @Published var eventName = ""
    @Published var eventDate: Date = .now
    @Published var eventLocation = ""
    @Published var eventDescription = ""
    @Published var eventType: EventType = .concert
    
    var filteredEvents: [Event] {
        events.filter { event in
            (filterType == nil ? true : event.type == filterType)
            && (searchText.isEmpty ? true : event.name.lowercased().contains(searchText.lowercased()))
        }
    }
    
    
    func removeEvent(event: Event) {
        events.removeAll { eventToRemove in
            eventToRemove.id == event.id
        }
    }
    
    func createNewEvent() {
        let newEvent = Event(name: eventName, date: eventDate, location: eventLocation, description: eventDescription, type: eventType)
        events.append(newEvent)
        eventName = ""
        eventLocation = ""
        eventDescription = ""
        eventType = .concert
        eventDate = .now
        showAddView = false
    }
}
