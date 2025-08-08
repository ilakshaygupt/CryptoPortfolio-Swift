//
//  ChartView.swift
//  CryptoTask
//
//  Created by Lakshay Gupta on 08/08/25.

import SwiftUI

import SwiftUI

public struct ChartView: View {
    @Binding var selectedRange: String
    @State private var selectedIndex: Int = 4 
    
    public init(selectedRange: Binding<String>) {
        self._selectedRange = selectedRange
    }
    
    struct DataPoint: Identifiable {
        let id = UUID()
        let date: String
        let value: Double
    }
    
    private var dummyData: [DataPoint] = [
        .init(date: "20 Mar", value: 85000),
        .init(date: "21 Mar", value: 110000),
        .init(date: "22 Mar", value: 95000),
        .init(date: "23 Mar", value: 125000),
        .init(date: "24 Mar", value: 142340),
        .init(date: "25 Mar", value: 115000),
        .init(date: "26 Mar", value: 130000)
    ]
    
    private var maxValue: Double {
        dummyData.map { $0.value }.max() ?? 1
    }
    
    private func xPosition(for index: Int, barWidth: CGFloat, spacing: CGFloat) -> CGFloat {
        CGFloat(index) * (barWidth + spacing) + barWidth / 2
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geo in
                let barWidth: CGFloat = 40
                let chartHeight = geo.size.height * 0.7
                let spacing = (geo.size.width - (CGFloat(dummyData.count) * barWidth)) / CGFloat(dummyData.count - 1)
                
                
                VStack(spacing: 4) {
                    Text(dummyData[selectedIndex].date)
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .medium))
                    HStack(spacing: 4) {
                        Text("₹").font(.system(size: 18, weight: .semibold))
                        Text("\(Int(dummyData[selectedIndex].value).formatted(.number))")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .foregroundColor(.white)
                }
                .position(
                    x: min(
                        max(xPosition(for: selectedIndex, barWidth: barWidth, spacing: spacing), 60),
                        geo.size.width - 60                     ),
                    y: geo.size.height * 0.15
                )


                ZStack {
                    
                    HStack(alignment: .bottom, spacing: spacing) {
                        ForEach(dummyData.indices, id: \.self) { i in
                            let barHeight = CGFloat(dummyData[i].value / maxValue) * chartHeight
                            RoundedRectangle(cornerRadius: 8)
                                .fill( LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.082, green: 0.082, blue: 0.082), // #151515
                                        Color(red: 0.031, green: 0.031, blue: 0.039)  // #08080A
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
)
                                .frame(width: barWidth, height: barHeight)
                        }
                    }
                    
                
                    Path { path in
                        for i in dummyData.indices {
                            let x = xPosition(for: i, barWidth: barWidth, spacing: spacing)
                            let y = chartHeight - (CGFloat(dummyData[i].value / maxValue) * chartHeight)
                            if i == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                let prevX = xPosition(for: i - 1, barWidth: barWidth, spacing: spacing)
                                let prevY = chartHeight - (CGFloat(dummyData[i - 1].value / maxValue) * chartHeight)
                                let controlX = (prevX + x) / 2
                                path.addCurve(to: CGPoint(x: x, y: y),
                                              control1: CGPoint(x: controlX, y: prevY),
                                              control2: CGPoint(x: controlX, y: y))
                            }
                        }
                    }
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                    
                    let handleY = chartHeight - (CGFloat(dummyData[selectedIndex].value / maxValue) * chartHeight)
                    Rectangle()
                        .fill(Color.white.opacity(0.4))
                        .frame(width: 1, height: chartHeight)
                        .position(x: xPosition(for: selectedIndex, barWidth: barWidth, spacing: spacing),
                                  y: chartHeight / 2)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 10, height: 10)
                        .shadow(color: .black.opacity(0.5), radius: 4)
                        .position(x: xPosition(for: selectedIndex, barWidth: barWidth, spacing: spacing),
                                  y: handleY)
                }
                .frame(height: chartHeight)
                .offset(y: geo.size.height * 0.3)
                .contentShape(Rectangle())
                .onTapGesture { location in
                    var closest = 0
                    var minDist = CGFloat.infinity
                    for i in dummyData.indices {
                        let dist = abs(location.x - xPosition(for: i, barWidth: barWidth, spacing: spacing))
                        if dist < minDist {
                            minDist = dist
                            closest = i
                        }
                    }
                    if closest != selectedIndex {
                        selectedIndex = closest
                    }
                }

            }
        }
        .frame(height: 250)
        .padding()
        .background(Color.black)
        .onChange(of: selectedRange) { _ in
            withAnimation(.easeInOut(duration: 0.3)) {
                selectedIndex = Int.random(in: 0..<dummyData.count)
            }
        }
        .animation(.easeInOut(duration: 0.25), value: selectedIndex)

    }
}
