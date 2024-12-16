//
//  LineTextField.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 16.12.2024.
//

import SwiftUI

// LineTextField Struct'ı
struct LineTextField: View {
    @Binding var txt: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(Color(hex: "#262729"))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if isPassword {
                SecureField(placeholder, text: $txt)
                    .frame(height:40)
            } else {
                TextField(placeholder, text: $txt)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .frame(height:40)

            }
            
            Divider()
        }
    }
}

// LineSecureField Struct'ı
struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(Color(hex: "#262729"))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height:40)


            } else {
                SecureField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height:40)

            }
            
            Divider()
        }
    }
}

// PreviewProvider, LineTextField için
struct LineTextField_Previews: PreviewProvider {
    @State static var txt: String = ""
    static var previews: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
