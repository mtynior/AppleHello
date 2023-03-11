//
//  MainScreen.swift
//  AppleHello
//
//  Created by Michal on 11/03/2023.
//

import SwiftUI

struct MainScreen: View {
    @State private var progress: CGFloat = 0

    var body: some View {
        VStack {
            HelloShape()
                .trim(from: 0.0, to: progress)
                .stroke(Self.gradient, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear(perform: animate)
        .onTapGesture {
            progress = 0
            animate()
        }
    }
}

// MARK: - Helpers
private extension MainScreen {
    static let gradient = LinearGradient(
        gradient:
            Gradient(colors: [
                .black,
                .green,
                .yellow,
                .orange,
                .red,
                .pink,
                .purple,
                .blue,
                .black
            ]
        ),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    func animate() {
        withAnimation(.easeInOut(duration: 3)) {
            progress = 1
        }
    }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
