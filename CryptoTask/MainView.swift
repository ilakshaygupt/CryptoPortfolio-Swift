//
//  ContentView.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 06/08/25.
//
import SwiftUI

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Analytics"
    @State private var selectedRange = "6m"
    @Namespace private var animation

    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                if selectedTab == "Analytics" {
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 20) {
                            PortfolioHeaderCard()
                            TimeRangeSelector(selectedRange: $selectedRange)
                            ChartView(selectedRange: $selectedRange)
                            CryptoCardRow()
                            RecentTransactionsView()
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 120)
                    }
                }
                else if selectedTab == "Exchange" {
                        ExchangeScreen()
                            .padding(.bottom, 120)
                    
                    
                }
                else if selectedTab == "Record" {
                    Text("Record Screen")
                        .foregroundColor(.white)
                }
                else if selectedTab == "Wallet" {
                    Text("Wallet Screen")
                        .foregroundColor(.white)
                }

                Spacer(minLength: 0)
            }
            
            VStack {
                Spacer()
                BottomNavBar(selectedTab: $selectedTab, animation: animation)
            }
        }
    }
}


#Preview {
    MainView()
}

