//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by kaustubh on 24/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var showExchangeInfo = false;
    @State var leftAmount = "";
    @State var rightAmount = "";
    
    
    var body: some View {
        ZStack{
            // Background Image
            Image(.background).resizable().ignoresSafeArea()
            
            VStack {
                // Pony image
                Image(.prancingpony).resizable().scaledToFit().frame(height: 200)
                // currency exchange text
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                // conversion section
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // currency image
                            Image(.silverpiece).resizable().scaledToFit().frame(height: 33)
                            
                            // currency text
                            Text("Silver Piece").font(.headline).foregroundStyle(.white)
                        }.padding(.bottom, -5)
                        
                        // text field
                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder);
                    }
                    // Equal sign
                    Image(systemName: "equal").font(.largeTitle).foregroundStyle(.white).symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // currency
                        HStack {
                            // Currency text
                            Text("Gold Piece").font(.headline).foregroundStyle(.white)
                            
                            // Currency Image
                            Image(.goldpiece).resizable().scaledToFit().frame(height: 33)
                        }.padding(.bottom, -5)
                        
                        // Text field
                        TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                    }
                }.padding().background(.black.opacity(0.5)).clipShape(.capsule)
                
                Spacer()
                
                // info button
                HStack {
                    Spacer ()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundStyle(.white)
                    }.padding(.trailing).sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
