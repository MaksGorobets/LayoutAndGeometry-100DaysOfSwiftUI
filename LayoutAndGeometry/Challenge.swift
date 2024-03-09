//
//  Challenge.swift
//  LayoutAndGeometry
//
//  Created by Maks Winters on 09.03.2024.
//

import SwiftUI

struct Challenge: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(hue: getHue(proxy: proxy), saturation: 1.0, brightness: 1.0))
                            .rotation3DEffect(getRotation(proxy: proxy, fullView: fullView), axis: (x: 0, y: 1, z: 0))
                            .opacity(getOpacity(proxy: proxy))
                            .scaleEffect(checkFifty(scale: proxy.frame(in: .global).minY / 500))
                            .onTapGesture {
                                print(proxy.frame(in: .global).minY)
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func getOpacity(proxy: GeometryProxy) -> Double {
        -(100 - proxy.frame(in: .global).minY) / 200
    }
    
    func getRotation(proxy: GeometryProxy, fullView: GeometryProxy) -> Angle {
        .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5
    }
    
    func getHue(proxy: GeometryProxy) -> Double {
        min(Double(proxy.frame(in: .global).minY) / 1000, 1.0)
    }
    
    func checkFifty(scale: Double) -> Double {
        max(scale, 0.5)
    }
    
}

#Preview {
    Challenge()
}
