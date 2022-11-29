//
//  ContentView.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 25/07/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show: Bool = false
    @State var viewState: CGSize = .zero
    @State var showCard: Bool = false
    @State var bottomCardState: CGSize = .zero
    @State var showFull: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20.0 : 0)
                .offset(y: showCard ? -200 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0: 10))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 1.0, y: 0.0, z: 0.0))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 1.0, y: 0.0, z: 0.0))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .background(Color.black)
                .frame(width: showCard ? 375 : 340, height: 220)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20.0)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0.0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.show = false
                }
            )
            
            BottomCardView(show: $showCard)
                .offset(x: 0.0, y: showCard ? 360.0 : 1000.0)
                .offset(y: bottomCardState.height)
                .blur(radius: show ? 20.0 : 0.0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.bottomCardState = value.translation
                        if self.showFull {
                            self.bottomCardState.height += -300
                        }
                        if self.bottomCardState.height < -300 {
                            self.bottomCardState.height = -300
                        }
                }
                .onEnded {_ in
                    if self.bottomCardState.height > 50 {
                        self.showCard = false
                    }
                    if (self.bottomCardState.height < -100 && !self.showFull) || (self.bottomCardState.height < -250 && self.showFull) {
                        self.bottomCardState.height = -300
                        self.showFull = true
                    } else {
                        self.bottomCardState = .zero
                        self.showFull = false
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20.0){
            Rectangle()
                .frame(width: 40.0, height: 6.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.subheadline)
            
            HStack(spacing: 20.0) {
                RingView(
                    color1: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
                    color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),
                    width: 88,
                    height: 88,
                    percent: 50.0,
                    show: $show
                )
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("12 of 12 Sections Completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color("background3"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            
            Spacer()
        }
        .padding(.top, 8.0)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("background3").opacity(0.5))
        .cornerRadius(30.0)
        .shadow(radius: 40.0)
    }
}
