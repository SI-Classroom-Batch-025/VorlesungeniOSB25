//
//  JSONSyntax.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 22.04.25.
//


struct JSONSyntax: Codable {
    var string: String
    var integer: Int
    var double: Double
    var array: [Int]
    var boolean: Bool
    var nullValue: String?
    var object: Object
}

struct Object: Codable {
    var key: String
}
