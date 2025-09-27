//
//  ExcahngeRate.swift
//  CurrencyConverter
//
//  Created by kaustubh on 25/09/2025.
//

import SwiftUI

struct CurrencyIcon: View {
    
    let currencyImage: ImageResource
    let currencyText: String
    
    var body: some View {
            ZStack(alignment: .bottom) {
                Image(currencyImage).resizable().scaledToFit()
                
                Text(currencyText).padding(3).font(.caption).frame(maxWidth: .infinity).background(.brown.opacity(0.75))
            }.padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyText: "Copper Penny")
}
