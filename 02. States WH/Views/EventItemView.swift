//
//  EventItemView.swift
//  02. States WH
//
//  Created by Felix B on 21.03.25.
//

import SwiftUI

struct EventItemView: View {
    
    let event: Event
    // Callback der der view mitgegeben wird, welcher beim löschen ausgeführt werden sollt () heißt kein Übergabeparameter, Void heißt kein Wert wird zurückgegeben
    let onDelete: () -> Void
    
    /*
     func onDelete() {
         
     }
     */
    
    
    @State var isExpanded = false
    @State var isLiked = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(event.name)
                    .font(.title)
                Spacer()
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(isLiked ? .red : .black)
                    .onTapGesture {
                        isLiked.toggle()
                    }
                    .symbolEffect(.variableColor, value: isLiked)
            }
            Divider()
                .overlay(.black)
            HStack {
                Text(event.type.rawValue)
                Spacer()
                Text(event.location)
                Spacer()
                Text(event.date.formatted(date: .numeric, time: .omitted))
            }
            if isExpanded {
                Text(event.description)
                    .padding(.top, 15)
                Button("Delete", role: .destructive) {
                    onDelete()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(.gray)
        .clipShape(.rect(cornerRadius: 20))
        .onTapGesture {
            isExpanded.toggle()
        }
    }
}

#Preview {
    EventItemView(event: Event(name: "Testevent", date: .now, location: "Hamburg", description: "ojfhaoishdoa sadjasojhfa sdaoskhdo aoslkd hlkasjd lkalkd alksdjlkasjdlk", type: .concert)) {
        
    }
}
