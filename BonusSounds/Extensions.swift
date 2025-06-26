//
//  Extensions.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 26.06.25.
//

import SwiftUI

extension Double {
    func toTimedString() -> String {
        let minutes = Int(self.rounded()) / 60
        let seconds = Int(self.rounded()) % 60
        return minutes == 0 ? seconds.description : "\(minutes):\(seconds)"
    }
}
