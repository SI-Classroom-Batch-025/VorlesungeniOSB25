//
//  ChartExample.swift
//  02. States
//
//  Created by Felix B on 20.03.25.
//

import SwiftUI
import Charts

struct ChartExample: View {
    
    
    // [wert1, wert2, wert3]
    // [wert1Key: wert1Value, wert2Key: wert2Value]
    let sales = [
        "Table": 200,
        "Chairs": 120,
        "Sofa": 30,
        "Lights": 400,
    ]
    
    var body: some View {
        Chart {
            ForEach(sales.keys.sorted(), id: \.self) { saleKey in
                BarMark(
                    x: .value("", saleKey),
                    y: .value("", sales[saleKey]!)
                )
            }
        }
    }
}

#Preview {
    ChartExample()
}
