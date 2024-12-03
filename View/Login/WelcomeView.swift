//
//  WelcomeView.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 30.11.2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .padding(.bottom, 8)
                
                Text("Welcome\nto our store")
                    .font(.customfont(.bold, fontSize: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                
                Text("Ger your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignInView(txtMobile: "")
                } label: {
                    RoundButton(title: "Get Started") {
                        }
                }

                
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
}

struct WelcomeView_Previews: PreviewProvider{
    static var previews: some View {
        
        NavigationView {
            WelcomeView()
        }
    }
}
