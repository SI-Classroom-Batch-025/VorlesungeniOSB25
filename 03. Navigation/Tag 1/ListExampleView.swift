//
//  ListExampleView.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ListExampleView: View {

    let numbers = [0, 1, 2, 3, 4, 5, 6]

    var body: some View {
        // Falls ihr den Fall haben solltet, das ihr eine List innherhalb einer Scrollview habt, dann müsst ihr der List eine Höhe, bzw wenn die Scrollview horizontal ist eine Breite geben.
        //        ScrollView {
        //            List(numbers, id: \.self) { number in
        //                Text(number.description)
        //            }
        //            .frame(height: 500)
        //        }
        
        // Diese Schreibweise macht vor allem dann sinn, wenn man Zugriff auf das onDelete der ForEach bekommen möchte.
        // Andernfalls kann man das ForEach hier drinnen weglassen
        List {
            ForEach(numbers, id: \.self) { number in
                Text(number.description)
            }
        }
    }
}

#Preview {
    ListExampleView()
}
