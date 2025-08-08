//
//  Transaction.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//


import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let icon: String 
    let iconColor: Color
    let title: String
    let date: String
    let amount: String
    let currency: String
}

struct RecentTransactionsView: View {
    
    let transactions: [Transaction] = [
        Transaction(icon: "bitcoinsign.circle.fill", iconColor: .orange, title: "Receive", date: "20 March", amount: "+0.002126", currency: "BTC"),
        Transaction(icon: "arrow.left.arrow.right", iconColor: .gray, title: "Send", date: "21 March", amount: "-0.001000", currency: "BTC"),
        Transaction(icon: "arrow.left.arrow.right", iconColor: .gray.opacity(0.5), title: "Exchange", date: "22 March", amount: "+0.002126", currency: "BTC"),
        Transaction(icon: "bitcoinsign.circle.fill", iconColor: .orange, title: "Receive", date: "23 March", amount: "+0.005000", currency: "BTC"),
        Transaction(icon: "arrow.left.arrow.right", iconColor: .gray, title: "Send", date: "24 March", amount: "-0.003000", currency: "BTC")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Recent Transactions")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(transactions) { transaction in
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(transaction.iconColor)
                                    .frame(width: 40, height: 40)
                                Image(systemName: transaction.icon)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(transaction.title)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                Text(transaction.date)
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 2) {
                                Text(transaction.currency)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Text(transaction.amount)
                                    .foregroundColor(transaction.amount.contains("-") ? .red : .green)
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }
                }
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
