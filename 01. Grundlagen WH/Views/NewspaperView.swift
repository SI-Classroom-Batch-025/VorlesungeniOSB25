//
//  NewspaperView.swift
//  01. Grundlagen WH
//
//  Created by Felix B on 14.03.25.
//

import SwiftUI

struct NewspaperView: View {
    var body: some View {
        ScrollView {
            Text("NEWS")
                .headlineStyling()
            VStack {
                ArticleView(article: .init(title: "Testtitel", content: "Irgendwas ist passiert.", image: "toast", postingDate: .now, author: "Tester"))
                ArticleView(article: .init(title: "Testtitel", content: "Irgendwas ist passiert.", image: "placeholder", postingDate: .now, author: "Tester"))
                ArticleView(article: .init(title: "Testtitel", content: "Irgendwas ist passiert.", image: "cloud", postingDate: .now, author: "Tester"))
            }
            .padding(.horizontal)

            
            Text("JOBLISTINGS")
                .headlineStyling()
            
            VStack {
                JoblistingView(jobListing: .init(title: "Testtitel", description: "Hier gibts nen job", requirements: "C++, Java", location: "Berlin", url: "www.syntax-institut.de"))
                JoblistingView(jobListing: .init(title: "Testtitel", description: "Hier gibts nen job", requirements: "C++, Java", location: "Berlin", url: "www.syntax-institut.de"))
                JoblistingView(jobListing: .init(title: "Testtitel", description: "Hier gibts nen job", requirements: "C++, Java", location: "Berlin", url: "www.syntax-institut.de"))
            }
            .padding(.horizontal)
        }
        .background(.gray)
    }
}

#Preview {
    NewspaperView()
}
