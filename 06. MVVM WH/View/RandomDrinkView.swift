//
//  RandomDrinkView.swift
//  06. MVVM WH
//
//  Created by Felix B on 09.05.25.
//

import SwiftUI

struct RandomDrinkView: View {
    
    @ObservedObject var drinkViewModel: DrinkViewModel
    
    var body: some View {
        VStack {
            if let drink = drinkViewModel.randomDrink {
                AsyncImage(url: URL(string: drink.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                VStack {
                    VStack(spacing: 20) {
                        Text(drink.name)
                                .font(.largeTitle)
                        HStack {
                            Text(drink.category)
                            Spacer()
                            Text(drink.alcoholic)
                        }
                        ScrollView {
                            Text(drink.instructions)
                                    .font(.callout)
                        }
                        
                    }
                }
                .padding()
                .background {
                    Rectangle()
                        .clipShape(.buttonBorder)
                        .foregroundStyle(.white)
                        .shadow(radius: 4)
                }
                .padding()
            }
            
            Button("Random") {
                drinkViewModel.getRandomDrink()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 30)
        }
    }
}

#Preview {
    RandomDrinkView(drinkViewModel: DrinkViewModel(drinkRepository: LocalDrinkRepository()))
}
