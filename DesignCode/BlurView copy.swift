//
//  BlurView.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 01/08/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let view: UIView = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        view.insertSubview(blurView, at: 0)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
