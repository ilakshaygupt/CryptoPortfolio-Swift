//
//  ExchangeTransaction.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//
import SwiftUI

struct ExchangeTransaction: Identifiable {
    let id = UUID()
    let type: ExchangeTransactionType
    let title: String
    let date: String
    let currency: String
    let amount: String
    
    enum ExchangeTransactionType {
        case send, receive
    }
}
