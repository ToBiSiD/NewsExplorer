//
//  SpinningCircle.swift
//  NewsExplorerTeamvoy
//
//  Created by Tobias on 30.07.2023.
//

import SwiftUI

struct SpinningCircle: View {
    @State private var progress = 0.0
    var lineWidth = 10.0
    var color: Color = .black
    
    var animation: Animation {
        .easeInOut(duration: 2)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        SpinnerCircleShape(progress: progress, lineWidth: lineWidth)
            .stroke(style: .init(lineWidth: lineWidth, lineCap: .round))
            .foregroundColor(color)
            .onAppear(){
                
                withAnimation(animation) {
                    progress = 1.0
                }
               
            }
    }
}

struct SpinnerCircleShape: Shape {
    var progress: Double
    let lineWidth: CGFloat
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let end = progress * progress * .pi * 2.0
        let start = end + end
        
        let halfWidth = rect.width/2.0 - lineWidth/2.0
        
        var path = Path()
        path.addArc(center: .init(x: rect.midX, y: rect.midY), radius: halfWidth, startAngle: .radians(start), endAngle: .radians(end), clockwise: false)
        return path
    }
}

struct SpinningCircle_Previews: PreviewProvider {
    static var previews: some View {
        SpinningCircle()
    }
}
