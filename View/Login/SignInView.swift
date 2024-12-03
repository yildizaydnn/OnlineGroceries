//
//  SignInView.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 3.12.2024.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    @State var txtMobile: String
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        ZStack {
            
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.5)
                
                Spacer()
            }
            
            ScrollView {
                VStack {
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.bold, fontSize: 26))
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack {
                        
                        Button {
                            isShowPicker = true
                        } label: {
                          
                            if let countryObj = countryObj {
                                Text("\(countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 33))
                                    .foregroundColor(.black)
                              
                                
                                Text("+\(countryObj.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.black)
                           
                            }
                            
                           
                            
                            
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0, maxHeight: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxHeight: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                }
                
                
                
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets +  .screenWidth )
                
                
                Button {
                    isShowPicker = true
                    
                } label: {
                    
                    Image("google_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    
                    Text("Continue with Google")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60, maxHeight:60)
                .background(Color(hex: "4287f5"))
                .cornerRadius(20)
                .padding()
            }
                
                
            }
            
       
        .onAppear(){
            self.countryObj = Country(phoneCode: "90", isoCode: "TUR")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
            
            
        }
    }
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView(txtMobile: "")
            
        }
    }

