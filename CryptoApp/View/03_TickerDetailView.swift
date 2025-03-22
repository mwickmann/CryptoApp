import SwiftUI

struct TickerDetailView: View {
    let ticker: CryptoTicker
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                                VStack {
                    Text(ticker.name)
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top)
                    
                    Text(ticker.symbol)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                
                VStack(spacing: 16) {
                    InfoCardsView(title: "💰 Pris", value: formatPrice(ticker.priceUSD, using: settings), isBold: true)
                    InfoCardsView(title: "🏆 Rangering", value: "\(ticker.rank)")
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {
                    Text("📊 Markedsendringer")
                        .font(.headline)
                    
                    VStack(spacing: 16) {
                        ForEach(changeValues(), id: \.title) { change in
                            TickerChangeView(title: change.title, change: change.value)
                        }
                    }
                }
                .infoCardStyle()

           
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("📈 \(ticker.name)")
        .navigationBarTitleDisplayMode(.inline)
    }

    func changeValues() -> [(title: String, value: Double)] {
        return [
            ("⏳ Siste time", ticker.change1h),
            ("📅 Siste døgn", ticker.change24h),
            ("📆 Siste uke", ticker.change7d)
        ]
    }
}

