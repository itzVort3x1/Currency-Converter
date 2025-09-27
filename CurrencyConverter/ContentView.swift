//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by kaustubh on 24/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var showExchangeInfo = false;
    @State var showExchangeCurrency = false;
    
    @State var leftAmount = "";
    @State var rightAmount = "";
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    
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
                            Image(leftCurrency.image).resizable().scaledToFit().frame(height: 33)
                            
                            // currency text
                            Text(leftCurrency.name).font(.headline).foregroundStyle(.white)
                        }.padding(.bottom, -5).onTapGesture {
                            showExchangeCurrency.toggle()
                        }
                        
                        // text field
                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder).focused($leftTyping)
                    }
                    // Equal sign
                    Image(systemName: "equal").font(.largeTitle).foregroundStyle(.white).symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        // currency
                        HStack {
                            // Currency text
                            Text(rightCurrency.name).font(.headline).foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image).resizable().scaledToFit().frame(height: 33)
                        }.padding(.bottom, -5).onTapGesture {
                            showExchangeCurrency.toggle()
                        }
                        
                        // Text field
                        TextField("Amount", text: $rightAmount).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing).focused($rightTyping)
                    }
                }.padding().background(.black.opacity(0.5)).clipShape(.capsule).keyboardType(.decimalPad)
                
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
                    }.sheet(isPresented: $showExchangeCurrency) {
                        SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                    }
                }
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
