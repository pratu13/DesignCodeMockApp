//
//  Buttons.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 17/09/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct Buttons: View {

    var body: some View {
        VStack(spacing: 50) {
            RectangleButton()
            
            CircleButton()
            
            PayButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 0.1326787243)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.0))
    }
}


struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

struct RectangleButton: View {
    @State var tap: Bool = false
    @State var press: Bool = false
    
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60, alignment: .center)
            .background(
                ZStack {
                    Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                    RoundedRectangle(cornerRadius: 16.0,style: .continuous)
                        .foregroundColor(Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .blur(radius: 4.0)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16.0,style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8193681836, green: 0.8781527877, blue: 0.9986500144, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .
                                                bottomTrailing))
                        .padding(2)
                        .blur(radius: 2.0)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16.0,style: .continuous))
            .overlay(
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.white.opacity(press ? 0 : 1))
                        .frame(width: press ? 64 : 54, height: press ? 4 : 50)
                        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .offset(x: press ? 70 : -10, y: press ? 16 : 0)
                    
                    Spacer()
                }
                
                
                
            )
            .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged({ (value) in
                    self.tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                })
                .onEnded({ (value) in
                    self.press.toggle()
                })
            )
    }
}

struct CircleButton: View {
    @State var tap: Bool = false
    @State var press: Bool = false
    var body: some View {
        ZStack {
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? -90 : 0)
                .rotation3DEffect(
                    Angle(degrees: press ? 20.0: 0.0),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
            
            Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 90)
                .rotation3DEffect(
                    Angle(degrees: press ? 0.0 : 20.0),
                    axis: (x: -10.0, y: 10.0, z: 0.0)
                )
        }
        .frame(width: 100, height: 100)
        .background(
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0): #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), Color(press ?#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10.0)
                    .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 3, x: -5, y: -5)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10.0)
                    .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 3, y: 3)
            }
            
        )
        .clipShape(Circle())
        .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2 : 1.0)
        .gesture(
            LongPressGesture().onChanged({ (value) in
                self.tap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.tap = false
                }
            })
            .onEnded({ (value) in
                self.press.toggle()
            })
        )
    }
}

struct PayButton: View {
    @GestureState var tap: Bool = false
    @State var press: Bool = false
    var body: some View {
        ZStack {
            Image("fingerprint")
                .opacity(press ? 0 : 1.0)
                .scaleEffect(press ? 0 : 1.0)
            
            Image("fingerprint-2")
                .clipShape(Rectangle().offset(y: tap ? 0 : 50))
                .animation(.easeInOut)
                .opacity(press ? 0 : 1.0)
                .scaleEffect(press ? 0 : 1.0)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .opacity(press ? 1 : 0)
                .scaleEffect(press ? 1 : 0.0)
            
        }
        .frame(width: 120, height: 120)
        .background(
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0): #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), Color(press ?#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10.0)
                    .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 3, x: -5, y: -5)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10.0)
                    .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 3, y: 3)
            }
            
        )
        .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: tap ? 0.001 : 1.0, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5.0, lineCap: .round))
                .frame(width: 88, height: 88, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180.0),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                .animation(.easeInOut)
                            
        )
        .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
        .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
        .scaleEffect(tap ? 1.2 : 1.0)
        .gesture(
            LongPressGesture().updating($tap) { (currentState, gestureState, transation) in
                gestureState = currentState
                
            }
            .onEnded({ (value) in
                self.press.toggle()
            })
        )
    }
}
