//
//  ExchangeSheetView.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//
import SwiftUI
import NavKit

struct ExchangeSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var fromCurrency = "ETH"
    @State private var toCurrency = "INR"
    @State private var fromAmount: String = ""
    @State private var toAmount: String = "0.00"
    @FocusState private var isTextFieldFocused: Bool
    
    var onExchangeTransactionComplete: (ExchangeTransaction) -> Void
    
    private let conversionRate: Double = 157342.05
    private let spread: Double = 0.002
    private let gasFee: Double = 120.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        HStack {
                            Button("Cancel") {
                                dismiss()
                            }
                            .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Exchange")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button("Reset") {
                                fromAmount = ""
                                toAmount = "0.00"
                            }
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        
                        VStack(spacing: 16) {
                            CurrencyInputView(
                                currency: $fromCurrency,
                                amount: $fromAmount,
                                title: "From",
                                isFocused: $isTextFieldFocused
                            )
                            
                            Button(action: swapCurrencies) {
                                Image(systemName: "arrow.up.arrow.down")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                    .frame(width: 44, height: 44)
                                    .background(
                                        Circle()
                                            .fill(Color.white.opacity(0.15))
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                            )
                                    )
                            }
                            
                            CurrencyInputView(
                                currency: $toCurrency,
                                amount: $toAmount,
                                title: "To",
                                editable: false
                            )
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 0) {
                            Text("Exchange Summary")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 16)
                            
                            VStack(spacing: 12) {
                                SummaryRow(
                                    title: "Rate",
                                    value: "1 \(fromCurrency) = ₹\(String(format: "%.2f", conversionRate))"
                                )
                                
                                SummaryRow(
                                    title: "Spread (\(String(format: "%.1f", spread * 100))%)",
                                    value: "₹\(String(format: "%.2f", (Double(fromAmount) ?? 0) * conversionRate * spread))"
                                )
                                
                                SummaryRow(
                                    title: "Network Fee",
                                    value: "₹\(String(format: "%.0f", gasFee))"
                                )
                                
                                Divider()
                                    .background(Color.white.opacity(0.2))
                                    .padding(.vertical, 8)
                                
                                SummaryRow(
                                    title: "You'll Receive",
                                    value: "₹\(toAmount)",
                                    bold: true,
                                    valueColor: .green
                                )
                            }
                            .padding(20)
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(16)
                            .padding(.horizontal, 20)
                        }
                        
                        Button(action: performExchange) {
                            HStack {
                                Text("Exchange \(fromAmount.isEmpty ? "0" : fromAmount) \(fromCurrency)")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.4, green: 0.3, blue: 0.8),
                                        Color(red: 0.2, green: 0.4, blue: 0.9)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(16)
                            .disabled(fromAmount.isEmpty || Double(fromAmount) == 0)
                            .opacity(fromAmount.isEmpty || Double(fromAmount) == 0 ? 0.5 : 1.0)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                }
                .scrollDismissesKeyboard(.interactively)
            }
        }
        .navigationBarHidden(true)
        .onChange(of: fromAmount) { _ in
            calculateConversion()
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
    
    func swapCurrencies() {
        let temp = fromCurrency
        fromCurrency = toCurrency
        toCurrency = temp
        calculateConversion()
    }
    
    func calculateConversion() {
        if let amount = Double(fromAmount), amount > 0 {
            let converted = amount * conversionRate * (1 - spread) - gasFee
            toAmount = String(format: "%.2f", max(0, converted))
        } else {
            toAmount = "0.00"
        }
    }
    
    func performExchange() {
        guard let amount = Double(fromAmount), amount > 0 else { return }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM"
        let currentDate = formatter.string(from: Date())
        
        let transactionType: ExchangeTransaction.ExchangeTransactionType = toCurrency == "INR" ? .send : .receive
        let transactionTitle = toCurrency == "INR" ? "Sold" : "Bought"
        let transactionAmount = transactionType == .receive ? "+\(fromAmount)" : "-\(fromAmount)"
        
        let newExchangeTransaction = ExchangeTransaction(
            type: transactionType,
            title: transactionTitle,
            date: currentDate,
            currency: fromCurrency,
            amount: transactionAmount
        )
        
        onExchangeTransactionComplete(newExchangeTransaction)
        
        print("Exchange executed: \(fromAmount) \(fromCurrency) to \(toAmount) \(toCurrency)")
        NavigationService.shared.pop()
    }
}
