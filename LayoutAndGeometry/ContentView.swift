//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Maks Winters on 06.03.2024.
//

import SwiftUI

extension VerticalAlignment {
    enum TitleCenteredToName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let titleCenteredToName = VerticalAlignment(TitleCenteredToName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .titleCenteredToName) {
            VStack {
                Text("Netural face")
                    .alignmentGuide(.titleCenteredToName) { d in
                        d[VerticalAlignment.center]
                    }
                Image(.neutralFaceEmoji1024X10248Jjj8Tdz)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            VStack {
                Text("in an emoji")
                    .alignmentGuide(.titleCenteredToName) { d in
                        d[VerticalAlignment.center]
                    }
                Text("MY HONEST REACTION")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
