//
//  BlurView.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 01/08/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style )
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context:  UIViewRepresentableContext<BlurView>) {
        
    }
}
