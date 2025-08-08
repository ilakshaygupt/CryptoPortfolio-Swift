//
//  ExchangeScreen.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//

import SwiftUI



import NavKit

struct ExchangeScreen: View {
    @State private var transactions: [ExchangeTransaction] = [
        ExchangeTransaction(
            type: .receive,
            title: "Receive",
            date: "20 March",
            currency: "BTC",
            amount: "+0.002126"
        ),
        ExchangeTransaction(
            type: .send,
            title: "Sent",
            date: "19 March",
            currency: "ETH",
            amount: "-0.003126"
        ),
        ExchangeTransaction(
            type: .send,
            title: "Send",
            date: "18 March",
            currency: "LTC",
            amount: "-0.02126"
        )
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            }
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Image(systemName: "bell")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        
                        
                        VStack(spacing: 12) {
                            Text("INR")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Capsule())
                            
                            Text("1,57,342.05")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            
                            HStack(spacing: 12) {
                                Text("₹1,342")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 16))
                                
                                Text("+4.6%")
                                    .foregroundColor(.green)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.4, green: 0.3, blue: 0.8),
                                    Color(red: 0.2, green: 0.4, blue: 0.9)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(24)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        HStack(spacing: 20) {
                            ActionButton(icon: "arrow.up", action: {})
                            
                            Button(action: {
                                NavigationService.shared.push(
                                    ExchangeSheetView { newExchangeTransaction in
                                        transactions.insert(newExchangeTransaction, at: 0)
                                    }
                                )
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .frame(width: 50, height: 50)
                                    .background(Color.white.opacity(0.2))
                                    .clipShape(Circle())
                            }


                            ActionButton(icon: "arrow.down", action: {})
                        }
                        .padding(.top, 24)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("ExchangeTransactions")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("Last 4 days")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 32)
                            
                            LazyVStack(spacing: 12) {
                                ForEach(transactions) { transaction in
                                    ExchangeTransactionRow(
                                        type: transaction.type,
                                        title: transaction.title,
                                        date: transaction.date,
                                        currency: transaction.currency,
                                        amount: transaction.amount
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 32)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct ExchangeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeScreen()
    }
}
