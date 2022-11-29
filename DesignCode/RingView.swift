//
//  RingView.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 28/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1: Color = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var color2: Color = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
    var width: CGFloat = 300.0
    var height: CGFloat = 300.0
    var percent: CGFloat = 54
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress: CGFloat = 1 - (percent / 100)
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [0,0], dashPhase: 0)
            )
                .rotationEffect(Angle(degrees: 90.0))
                .rotation3DEffect(Angle(degrees: 180), axis: (x:  1, y: 0, z: 0))
                .frame(width: width, height: height)
//                .shadow(color: color2, radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .fontWeight(.bold)
                .font(.system(size: 14 * multiplier))
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
