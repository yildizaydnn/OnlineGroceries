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
        }
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider{
    static var previews: some View {
        WelcomeView()
    }
}
