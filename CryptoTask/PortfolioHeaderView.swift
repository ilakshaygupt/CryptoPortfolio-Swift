//
//  PortfolioHeaderView.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.
//

import SwiftUI

struct PortfolioHeaderCard: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.3, green: 0.43, blue: 0.96),
                    Color(red: 0.21, green: 0.31, blue: 0.78),
                    Color(red: 0.11, green: 0.09, blue: 0.47),
                    Color.black.opacity(0.2)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .clipShape(RoundedCorner(radius: 24, corners: [.bottomLeft, .bottomRight]))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(spacing: 4) {
                        Rectangle()
                            .fill(Color.white.opacity(0.9))
                            .frame(width: 20, height: 2)
                            .cornerRadius(1)
                        Rectangle()
                            .fill(Color.white.opacity(0.9))
                            .frame(width: 20, height: 2)
                            .cornerRadius(1)
                        Rectangle()
                            .fill(Color.white.opacity(0.9))
                            .frame(width: 20, height: 2)
                            .cornerRadius(1)
                    }
                    
                    Spacer()
                    ZStack {
                        Path { path in
                            path.move(to: CGPoint(x: 10, y: 4))
                            path.addCurve(to: CGPoint(x: 6, y: 8), control1: CGPoint(x: 8, y: 4), control2: CGPoint(x: 6, y: 6))
                            path.addLine(to: CGPoint(x: 6, y: 12))
                            path.addLine(to: CGPoint(x: 14, y: 12))
                            path.addLine(to: CGPoint(x: 14, y: 8))
                            path.addCurve(to: CGPoint(x: 10, y: 4), control1: CGPoint(x: 14, y: 6), control2: CGPoint(x: 12, y: 4))
                            path.closeSubpath()
                            path.move(to: CGPoint(x: 8, y: 14))
                            path.addLine(to: CGPoint(x: 12, y: 14))
                        }
                        .stroke(Color.white.opacity(0.9), lineWidth: 1.5)
                        .frame(width: 20, height: 20)
                        .scaleEffect(2.0)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Portfolio Value")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.white.opacity(0.9))
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Color.white.opacity(0.7))
                        Spacer()
                        ToggleButtons()
                    }
                    
                    HStack(alignment: .bottom, spacing: 4) {
                        Text("₹")
                            .font(.system(size: 32, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text("1,57,342")
                            .font(.system(size: 48, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(".05")
                            .font(.system(size: 32, weight: .regular))
                            .foregroundColor(.white)
                            .padding(.bottom, 2)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
        .frame(width: .infinity, height: 200)
        .padding(.horizontal,8)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct ToggleButtons: View {
    @State private var selected = "cash"
    
    var body: some View {
        ZStack(alignment: selected == "cash" ? .leading : .trailing) {
            
            Color.black.opacity(0.4)
                .clipShape(Capsule())
            
            Capsule()
                .fill(Color.black)
                .frame(width: 60, height: 40)
                .padding(4)
                .animation(.easeInOut(duration: 0.25), value: selected)
            
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        selected = "cash"
                    }
                }) {
                    HStack {
                        Spacer()
                        Image(systemName: "banknote")
                            .font(.system(size: 22))
                            .foregroundColor(selected == "cash" ? .white : .gray)
                        Spacer()
                    }
                    .frame(width: 60, height: 40)
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        selected = "bitcoin"
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("₿")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(selected == "bitcoin" ? .white : .gray)
                        Spacer()
                    }
                    .frame(width: 60, height: 40)
                }
            }
        }
        .frame(width: 120, height: 48)
    }
}

