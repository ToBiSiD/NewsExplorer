//
//  AnimatedTextWithDotsView.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 30.07.2023.
//

import SwiftUI

struct AnimatedTextWithDotsView: View {
    @State private var dots: String = ""
    
    let text: String
    private let now: Date = .now
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(text + dots)
                .font(.footnote)
                .transition(.slide)
        }
        .onReceive(timer) { time in
            let tick: Int = .init(time.timeIntervalSince(now) / 0.2) - 1
            let count: Int = tick % 4
            dots = String(Array(repeating: ".", count: count))
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
}

struct AnimatedTextWithDotsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTextWithDotsView(text: "Searching")
    }
}
