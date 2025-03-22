import SwiftUI


struct GlobalDataView: View {
    let data: CryptoData
    let lastUpdated: Date?

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                LazyVGrid(columns: columns, spacing: 16) {
                    InfoCardView(title: "Markedsstatus", value: FormattingHelpers.formatMarketCap(data.totalMcap))
                    InfoCardView(title: "Antall Coins", value: "\(data.coinsCount)")
                    InfoCardView(title: "Aktive Markeder", value: "\(data.activeMarkets)")
                    InfoCardView(title: "Markedsverdi", value: FormattingHelpers.formatMarketCap(data.totalMcap))
                    InfoCardView(title: "BTC Dominance", value: "\(data.btcDominance)%")
                    InfoCardView(title: "Markedsendring",
                                 value: "\(data.mcapChange)%",
                                 color: FormattingHelpers.marketChangeColor(data.mcapChange))
                }
                .padding(.horizontal)
                
                if let lastUpdated = lastUpdated {
                    Text("Sist oppdatert: \(FormattingHelpers.formatDate(lastUpdated))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
            }
            .padding()
        }
    }
}
