//
//  SummaryRow.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//
import SwiftUI


struct SummaryRow: View {
    var title: String
    var value: String
    var bold: Bool = false
    var valueColor: Color = .white
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: bold ? .semibold : .regular))
                .foregroundColor(valueColor)
        }
    }
}
