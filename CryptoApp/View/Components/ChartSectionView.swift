//
//  ChartSectionView.swift
//  CryptoApp
//

import SwiftUI
import Charts

struct ChartSectionView: View {
    let stats: [CryptoStatistics]
    let yDomain: ClosedRange<Double>
    @Binding var selectedStatID: UUID?

    var body: some View {
        Chart {
            ForEach(stats) { stat in
                BarMark(
                    x: .value("Krypto", stat.cryptoName),
                    y: .value("Endring (%)", stat.change)
                )
                .foregroundStyle(colorForPeriod(stat.period))
                .position(by: .value("Periode", stat.period))
                .annotation(position: .top) {
                    if selectedStatID == stat.id {
                        Text("\(stat.cryptoName) \(stat.period): \(String(format: "%.1f%%", stat.change))")
                            .font(.caption)
                            .padding(4)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(4)
                    }
                }
            }
        }
        .chartXAxisLabel("Kryptovaluta")
        .chartYAxisLabel("Endring (%)")
        .chartYScale(domain: yDomain)
        .frame(height: 400)
        .padding()
        }
    }
    
    private func colorForPeriod(_ period: String) -> Color {
        switch period {
        case "1h": return Color.blue
        case "24h": return Color.gray
        case "7d": return Color.purple
        default: return Color.primary
        }
    }
