//
//  GestureView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 22.05.25.
//

import SwiftUI

struct GestureView: View {
    
    @State private var offset = CGSize.zero
    @State private var angle = Angle.zero
    @GestureState private var scale = 1.0
    
    var body: some View {
        
        Image(systemName: "trash")
            .resizable()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .rotationEffect(angle)
            .gesture(
                SimultaneousGesture(
                    RotateGesture()
                        .onChanged { gesture in
                            angle = gesture.rotation
                        }
                        .onEnded { gesture in
                            angle = .zero
                        },
                    MagnifyGesture()     // Magnification, Scale
                        .updating($scale) { value, state, transaction in
                            state = value.magnification
                        }
                )
            )
//            .scaleEffect(scale)
//            .gesture(
//                MagnifyGesture()     // Magnification, Scale
//                    .updating($scale) { value, state, transaction in
//                        state = value.magnification
//                    }
//            )
//            .rotationEffect(angle)
//            .gesture(
//                RotateGesture()
//                    .onChanged { gesture in
//                        angle = gesture.rotation
//                    }
//                    .onEnded { gesture in
//                        angle = .zero
//                    }
//            )
//            .offset(offset)
//            .gesture(
//                DragGesture()
//                    .onChanged { gesture in
//                        offset = gesture.translation
//                    }
//                    .onEnded { gesture in
//                        if gesture.translation.height > 0 {
//                            print("Dropped Down")
//                        }
//                        offset = .zero
//                    }
//            )
    }
}

#Preview {
    GestureView()
}
