//
//  CountryPickerUI.swift
//  OnlineGroceries
//
//  Created by Yıldız Aydın on 3.12.2024.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {
    
    @Binding var country: Country?
   
    class Coordinator: NSObject,CountryPickerDelegate {
        var parent: CountryPickerUI
        
        init(parent: CountryPickerUI) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "TUR"
        countryPicker.delegate = context.coordinator
           return countryPicker
    }
    
 
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

