//
//  ZStackExampleView.swift
//  01. Grundlagen
//
//  Created by Felix B on 12.03.25.
//

import SwiftUI

struct ZStackExampleView: View {
    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Ich bin oben Links!")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //.background(.blue)
                    
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Ich bin unten Rechts!")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                //.background(.green)
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            Text("Ich bin in der Mitte!")
        }
        
    }
}

#Preview {
    ZStackExampleView()
}
