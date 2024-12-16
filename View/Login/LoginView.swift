//
//  LoginView.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 3.12.2024.
//

import SwiftUI

struct LoginView: View {
  
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    
    
    var body: some View {
       
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth , height: .screenHeight)
            
            
            VStack{
               
            
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
                Spacer()
                    .frame(height: .screenWidth * 0.12)
                
                Text("Loging")
                    .font(.customfont(.regular, fontSize: 26))
                    .foregroundStyle(.primary)
                    .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom,4)
              
                Text("Enter your emails and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondary)
                    .frame(minWidth: 0, maxWidth: .infinity ,alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(txt: $loginVM.txtEmail, title: "Email", placeholder: "Enter your email address",  keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineSecureField( title: "Password", placeholder: "Enter your password" , txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                    
                
               
                Button{
                    
                } label: {
                    Text("Forgot password")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color(hex: "#262729"))
                }
                .frame(minWidth: 0, maxWidth: .infinity , alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.02)

                
                RoundButton(title: "Get Started") {
                    
                }
                
                HStack {
                    Text("Don't have an account?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color(hex: "#262729"))
                   
                    Text("Signup")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundStyle(Color(hex: "6ca05d"))
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
          
            
            
            VStack {
                
                HStack {
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 20)
                    }
                    
                    Spacer()
                }
                
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
       
    }
}

// Preview for the LoginView
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
                .previewDevice("iPhone 14") // Specify a device for preview
        }
    }
}
