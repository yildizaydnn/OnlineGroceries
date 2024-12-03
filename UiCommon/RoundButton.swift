//
//  RoundButton.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 3.12.2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (() -> ())?
   
    
    var body: some View {
       
        Button {
            
        } label: {
            Text(title)
                .font(.customfont(.bold, fontSize: 20))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60, maxHeight:60)
        .background(Color(hex: "6da507"))
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton()
        .padding(20)
    
    
}
