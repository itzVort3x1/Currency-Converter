//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by kaustubh on 25/09/2025.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // background image
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            
            VStack {
                // title
                Text("Excahnge Rates").font(.largeTitle).tracking(3)
                // text block
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates: ").font(.title3).padding()
                
                ExchangeRate(leftImage: .goldpiece, exchangeRateText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, exchangeRateText: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, exchangeRateText: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpenny, exchangeRateText: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                // done button
                Button("Done") {
                    dismiss()
                }.buttonStyle(.borderedProminent).tint(.brown.mix(with: .black, by: 0.2)).font(.largeTitle).padding().foregroundStyle(.white)
            }.foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


