//
//  DrinkListView.swift
//  06. MVVM WH
//
//  Created by Felix B on 09.05.25.
//

import SwiftUI

struct DrinkListView: View {
    
    @ObservedObject var drinkViewModel: DrinkViewModel
    @AppStorage("isDarkmode") var isDarkmode: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
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
            }
            .preferredColorScheme(isDarkmode ? .dark : .light)
            .background(.app)
            //.searchable(text: $drinkViewModel.searchTerm)
        }
        
    }
}

#Preview {
    DrinkListView(drinkViewModel: DrinkViewModel(drinkRepository: LocalDrinkRepository()))
}

