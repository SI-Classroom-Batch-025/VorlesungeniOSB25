//
//  ContentView.swift
//  BonusTipKit
//
//  Created by Felix B on 17.06.25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    let students = [
        "Student1",
        "Student2",
        "Student3",
        "Student4"
    ]
    
    // Wenn wir Tips in einer Abfolge anzeigen lassen wollen, dann müssen wir dies mit Hilfe einer TipGroup machen.
    @State var tips = TipGroup(.ordered) {
        OnboardTipTwo()
        OnboardTipThree()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            // Damit die tips einer Tipgroup an dem richtigen UI Element angezeigt werden, müssen wir die tips optional casten.
                .popoverTip(tips.currentTip as? OnboardTipTwo)
                .padding(.bottom, 50)
                
                
            Text("Hello, world!")
                .popoverTip(tips.currentTip as? OnboardTipThree)
                
            Button("Testbutton") {
                Task {
                    // Zählen das buttonclicked event vom OnboardTipOne einmal hoch. (+=1)
                    await OnboardTipOne.buttonClicked.donate()
                }
            }
            .buttonStyle(.borderedProminent)
            .popoverTip(OnboardTipOne(performableAction: {
                print("TEST")
            })) // "Overlay" tip der über die View drübergelegt wird
            
            List {
                // TipView(OnboardTipOne()) // Inline Tip der in die View mit eingebaut wird
                ForEach(students, id: \.self) { student in
                    Text(student)
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .task {
            // Um für Testzwecke die Tips in der Preview zu resetten
            try? await Tips.resetDatastore()
            // Muss für jede Preview eingefügt werden, in der wir Tips anzeigen lassen möchten, damit wir sie beim testen sehen können.
            try? Tips.configure()
        }
}
