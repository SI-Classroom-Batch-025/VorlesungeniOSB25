//
//  UIComponentsView.swift
//  02. States
//
//  Created by Felix B on 20.03.25.
//

import SwiftUI

struct UIComponentsView: View {
    
    @State private var sliderAmount = 0.0
    @State private var stepperCounter = 0
    
    var body: some View {
        // in und step, sowie die labels können weggelassen werden, machen aber sehr oft sinn benutzt zu werden.
        // in =  der Bereich in dem sich die Werte befinden
        // step = die Schritte die beim Sliden genommen werden
        Slider(value: $sliderAmount, in: 0...1, step: 0.1) {
            Text("0")
        } minimumValueLabel: {
            Text("0%")
        } maximumValueLabel: {
            Text("100%")
        }
        .tint(.red)
//        .onChange(of: sliderAmount) { oldValue, newValue in
//            stepperCounter = Int(newValue / 0.05)
//        }
        // Für Markierungen der Abstufungen
//        .background() {
//            HStack {
//                ForEach(0..<10) { _ in
//                    Circle()
//                        .frame(width: 10, height: 10)
//                        .foregroundStyle(.gray)
//                        .padding(5)
//                }
//            }
//        }
        Text("\(String(format: "%.0f", sliderAmount * 100))%")
        
        Stepper("Wählen sie die Menge aus", value: $stepperCounter, in: 0...20)
//            .onChange(of: stepperCounter) { oldValue, newValue in
//                sliderAmount = 0.05 * Double(newValue)
//            }
        Text("Der derzeitige Wert ist: \(stepperCounter)")
        
        Gauge(value: sliderAmount, in: 20...30) {
            Text("Slideramount")
        } currentValueLabel: {
            Text("\(String(format: "%.0f", sliderAmount + 20))°C")
        } minimumValueLabel: {
            Text("20")
        } maximumValueLabel: {
            Text("30")
        }
        .gaugeStyle(.accessoryCircular)
        .tint(sliderAmount >= 6 ? .red : sliderAmount >= 3 ? .yellow : .green)
        ProgressView()
//            .scaleEffect(5.0)
//            .frame(width: 150, height: 150)
        
        ProgressView("Ladefortschritt", value: sliderAmount)
    }
}

#Preview {
    UIComponentsView()
}
