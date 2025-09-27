//
//  ExcahngeRate.swift
//  CurrencyConverter
//
//  Created by kaustubh on 25/09/2025.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            // Parchment background image
            
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            
            VStack {
                // Text
                Text("Select the currency you are starting with: ").fontWeight(.bold)
                
                // Currency icons
                IconGrid(currency: $leftCurrency)
                
                
                // Text
                Text("Select the currency you would like to convert to: ").fontWeight(.bold).padding(.top)
                
                // Currency icons
                IconGrid(currency: $rightCurrency)
                
                // Done button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }.padding().multilineTextAlignment(.center).foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    SelectCurrency(leftCurrency: $topCurrency, rightCurrency: $bottomCurrency)
}
