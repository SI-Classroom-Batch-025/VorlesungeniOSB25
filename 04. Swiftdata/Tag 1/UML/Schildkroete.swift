//
//  Schildkröte.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 31.03.25.
//

class Schildkroete: Tier {
    init(spitzname: String) {
        super.init(spitzname: spitzname, canFly: false, canSwim: true)
    }
}
