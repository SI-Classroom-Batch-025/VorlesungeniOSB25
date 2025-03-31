//
//  Tier.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 31.03.25.
//

open class Tier {
    var spitzname: String
    var canFly: Bool
    var canSwim: Bool
    
    init(spitzname: String, canFly: Bool, canSwim: Bool) {
        self.spitzname = spitzname
        self.canFly = canFly
        self.canSwim = canSwim
    }
    
    func toString() -> String {
        return "\(spitzname) kann fliegen? \(canFly) und kann Schwimmen? \(canSwim)"
    }
    
    func essen() {
        
    }
}
