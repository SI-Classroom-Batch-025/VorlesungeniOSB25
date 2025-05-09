//
//  DrinkListView.swift
//  06. MVVM WH
//
//  Created by Felix B on 09.05.25.
//

import SwiftUI

struct DrinkListView: View {
    
    @ObservedObject var drinkViewModel: DrinkViewModel
    
    var body: some View {
        HStack {
            TextField("Suche...", text: $drinkViewModel.searchTerm)
            Button {
                drinkViewModel.getDrinkByName()
            } label: {
                Image(systemName: "magnifyingglass")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        NavigationStack {
            List(drinkViewModel.drinks) { drink in
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: drink.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text(drink.name)
                            .font(.title2)
                        HStack {
                            Text(drink.category)
                                .font(.caption)
                            Spacer()
                            Text(drink.alcoholic)
                                .font(.caption)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            //.searchable(text: $drinkViewModel.searchTerm)
        }
    }
}

#Preview {
    DrinkListView(drinkViewModel: DrinkViewModel(drinkRepository: LocalDrinkRepository()))
}
