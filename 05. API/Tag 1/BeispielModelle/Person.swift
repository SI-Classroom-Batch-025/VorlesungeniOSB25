//
//  Person.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 22.04.25.
//


struct Person: Codable {
    var name: String
    var age: Int
    var email: String
    var hobbies: [String]
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

// Codable = Decodable + Encodable
/*
 Encoding -> Struct zu JSON
 Decoding -> JSON zu Struct
 */
