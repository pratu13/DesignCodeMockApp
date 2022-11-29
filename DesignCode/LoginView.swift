//
//  LoginView.swift
//  DesignCode
//
//  Created by Pratyush Sharma on 25/09/20.
//  Copyright © 2020 Pratyush Sharma. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isfocused: Bool = false
    @State var showAlert: Bool = false
    @State var alertMessage: String = "Something went wrong"
    @State var isLoading: Bool = false
    @State var isSuccessfull: Bool = false
    @EnvironmentObject var user: UserStore
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func login() {
        self.hideKeyboard()
        self.isfocused = false
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            self.isLoading = false
            if err != nil {
                self.alertMessage = err?.localizedDescription ?? ""
                self.showAlert = true
            } else {
                self.isSuccessfull = true
                self.user.isLogged = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isSuccessfull = false
                    self.email = ""
                    self.password = ""
                    self.user.showLogin = false
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack(alignment: .top) {
            
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                    .offset(y: isfocused ? -300 : 0.0)
                
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5.0)
                            .padding(.leading, 16)
                        
                        TextField("Your email".uppercased(), text: $email)
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                            // .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height: 44.0)
                            .onTapGesture {
                                self.isfocused = true
                            }
                    }
                    
                    Divider().padding(.leading, 80)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5.0)
                            .padding(.leading, 16)
                        
                        SecureField("Your Password".uppercased(), text: $password)
                            .keyboardType(.default)
                            .font(.subheadline)
                            // .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height: 44.0)
                            .onTapGesture {
                                self.isfocused = true
                            }
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20.0)
                .padding(.horizontal)
                .offset(y: 460.0)
                .offset(y: isfocused ? -300 : 0.0)
                
                
                HStack {
                    Text("Forgot Password?")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.login()
                    }) {
                        Text("Login")
                            .foregroundColor(.black)
                    }
                    .padding(.all, 12)
                    .padding(.horizontal, 30)
                    .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20.0)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("\(self.alertMessage)"), dismissButton: .default(Text("OK")))
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .bottom)
                .padding()
                
            }
            .animation(.easeInOut)
            .onTapGesture {
                self.isfocused = false
                self.hideKeyboard()
            }
            
            if isLoading {
                LoadingView()
            }
            
            if isSuccessfull {
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CoverView: View {
    @State var show: Bool = false
    @State var viewState: CGSize = .zero
    @State var isDragging: Bool = false
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Learn design & code.\nFrom scratch.")
                    .font(.system(size: geometry.size.width/10, weight: .bold))
                    .foregroundColor(.white)
                    .offset(x: viewState.width/15, y: viewState.height/15)
                
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            
            Text("80 hours of courses fro SwiftUI, Reat and design tools")
                .font(.subheadline)
                .frame(width: 250)
                .offset(x: viewState.width/20, y: viewState.height/20)
            
            Spacer()
        }
        .padding(.top, 100)
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    .rotationEffect(Angle(degrees: show ? 480 : 90.0))
                    .blendMode(.plusDarker)
                .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    .onAppear {
                        self.show = true
                    }
                
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: show ? 360.0 : 0.0), anchor: .leading)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false))
                    .blendMode(.overlay )
            }
            //.animation(nil)
        )
        .background(Image(uiImage: #imageLiteral(resourceName: "Card3")).offset(x: viewState.width/25, y: viewState.height/25), alignment: .bottom)
        .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
        .multilineTextAlignment(.center)
        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1.0)
        .animation(.timingCurve(0.2, 0.8, 0.2,1, duration: 0.8))
        .rotation3DEffect(
            Angle(degrees: 5.0),
            axis: (x: viewState.width, y: viewState.height, z: 0.0)
        )
        
        .gesture(
            DragGesture()
                .onChanged{ (value) in
                    self.viewState = value.translation
                    self.isDragging = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.isDragging = false
                    
                }
        )
    }
}
