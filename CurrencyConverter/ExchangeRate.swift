//
//  ExcahngeRate.swift
//  CurrencyConverter
//
//  Created by kaustubh on 25/09/2025.
//

import SwiftUI

struct ExchangeRate: View {
    
    let leftImage: ImageResource
    let exchangeRateText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            Image(leftImage).resizable().scaledToFit().frame(height: 33)
            
            Text(exchangeRateText)
            
            Image(rightImage).resizable().scaledToFit().frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, exchangeRateText: "1 Gold Piece = 4 Gold Pennies", rightImage: .silverpenny)
}
