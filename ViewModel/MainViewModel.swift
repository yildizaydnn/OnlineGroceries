//
//  MainViewModel.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 16.12.2024.
//

import SwiftUI

class MainViewModel: ObservableObject {
  
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
}

