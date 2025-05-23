//
//  Fact.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

struct Fact: Codable, Identifiable {
    var id: String
    var text: String
    var source: String
    var sourceURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, text, source
        case sourceURL = "source_url"
    }
}


/*
 
 {
 "id": "9e09ee36864c2998508ba83e552426f9",
 "text": "Briten verbringen durchschnittlich ein halbes Jahr ihres Lebens mit Anstehen.",
 "source": "NEON",
 "source_url": "http://www.neon.de/artikel/kaufen/produkte/briten-verbringen-durchschnittlich-ein-halbes-jahr-ihres-lebens-mit-anstehen/1044928",
 "language": "de",
 "permalink": "https://uselessfacts.jsph.pl/api/v2/facts/9e09ee36864c2998508ba83e552426f9"
 }
 */
