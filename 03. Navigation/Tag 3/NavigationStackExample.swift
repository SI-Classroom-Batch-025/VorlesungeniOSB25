//
//  NavigationStackExample.swift
//  03. Navigation
//
//  Created by Felix B on 26.03.25.
//

import SwiftUI

struct NavigationStackExample: View {

    let numbers = [1, 2, 3, 4, 5]

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(numbers, id: \.self) { row in
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(numbers, id: \.self) { number in
                                    NavigationLink {
                                        NumberSubview(number: number)
                                    } label: {
                                        Text(number.description)
                                            .padding()
                                            .background(.red)
                                            .clipShape(.rect(cornerRadius: 10))
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
                Spacer()
                NavigationLink {
                    SheetExample()
                } label: {
                    Text("Navigiere zu sheetview!")
                }
                .buttonStyle(.borderedProminent)

                
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "globe")
                    }
                }
            }
        }
        
    }
}

struct NumberSubview: View {
    
    var number: Int
    
    var body: some View {
        Text(number.description)
    }
}

#Preview {
    NavigationStackExample()
}
