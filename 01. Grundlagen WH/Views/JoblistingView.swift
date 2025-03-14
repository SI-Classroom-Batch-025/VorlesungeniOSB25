//
//  JoblistingView.swift
//  01. Grundlagen WH
//
//  Created by Felix B on 14.03.25.
//

import SwiftUI

struct JoblistingView: View {
    
    let jobListing: JobListing
    
    var body: some View {
        VStack(spacing: 0) {
            Text(jobListing.title)
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Divider()
                .padding(.bottom, 10)
            Text(jobListing.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            Divider()
                .padding(.bottom, 10)
            
            Text(jobListing.requirements)
                .font(.subheadline)
                .padding(.bottom, 10)
            
            HStack {
                Button(jobListing.url) {
                    print("Der user wird auf \(jobListing.url) weitergeleitet...")
                }
                Spacer()
                Text(jobListing.location)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.gray.mix(with: .white, by: 0.3))
        .clipShape(.rect(cornerRadius: 10))
        
    }
}

#Preview {
    JoblistingView(jobListing: .init(title: "Testtitel", description: "Hier gibts nen job", requirements: "C++, Java", location: "Berlin", url: "www.syntax-institut.de"))
}
