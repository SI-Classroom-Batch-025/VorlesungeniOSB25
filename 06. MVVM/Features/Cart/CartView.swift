//
//  CartView.swift
//  06. MVVM
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct CartView: View {
    
    // ObservedObject wird nie sofort initialisiert, sondern erst beim Aufruf der View mitgegeben.
    // Wenn wir ein ObservedObject erstellen müssen wir 2 Sachen beachten:
    // 1. Kein = Zeichen, wird bringen das viewModel von außen mit
    // 2. Nicht private stellen
    @ObservedObject var cartViewModel: CartViewModel
    
    // EnvironmentObject wird ähnlich wie das ObservedObject nicht direkt initialisiert sondern durch den Property Wrapper automatisch aus dem Environment gezogen.
    // Also gilt auch hier kein = Zeichen
    // Wenn wir ein EnvironmentObject haben, sollte die Preview auch ein environmentObject modifiert bekommen.
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    // Für beide gilt jedoch auch, es muss irgendwo in der App schon ein StateObject von dem gewünschten ViewModel existieren
    
    var body: some View {
        List(cartViewModel.cart) { product in
            HStack {
                Text(product.name)
                Spacer()
                Text(product.price.description)
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(settingsViewModel.color)
    }
}

#Preview {
    CartView(cartViewModel: CartViewModel())
    // Jede View die auf ein environmentObject zugreift, sollte diesen Modifier mit dem jeweiligen ViewModel haben.
        .environmentObject(SettingsViewModel())
}
