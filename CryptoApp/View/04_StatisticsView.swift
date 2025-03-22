import SwiftUI
import Charts

struct StatisticsView: View {
    @StateObject private var viewModel = TickersViewModel()
    @EnvironmentObject var settings: AppSettings
    @State private var selectedCryptos: Set<String> = ["All"]
    @State private var selectedStatID: UUID? = nil
    @State private var showMoneyAnimation = false
    @State private var selectedTicker: CryptoTicker? = nil
    @State private var navigateToDetail = false
    
    let cryptoOptions = ["All", "Bitcoin", "Ethereum", "Ripple", "Litecoin", "Cardano"]
    let defaultCryptoSet = ["Bitcoin", "Ethereum", "Ripple", "Litecoin", "Cardano"]
    
    var stats: [CryptoStatistics] {
        filterAndMapTickers(viewModel.tickers, selectedCryptos: selectedCryptos, defaultCryptoSet: defaultCryptoSet)
    }
    
    var yDomain: ClosedRange<Double> {
        calculateYDomain(stats: stats)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    CryptoSelectionView(cryptoOptions: cryptoOptions, selectedCryptos: $selectedCryptos) { crypto in
                        withAnimation {
                            updateSelectedCrypto(for: crypto, selectedCryptos: &selectedCryptos)
                        }
                        selectedStatID = nil
                    }
                    
                    if viewModel.tickers.isEmpty {
                        ProgressView("Laster data...")
                            .padding()
                            .onAppear { Task { await viewModel.fetchTickers() } }
                    } else {
                        StatisticsHeaderView(selectedCryptos: selectedCryptos, firstTicker: viewModel.tickers.first, settings: settings)
                        ChartLegendView()
                        ChartSectionView(stats: stats, yDomain: yDomain, selectedStatID: $selectedStatID)
                        
                        if shouldShowInfoButton(selectedCryptos: selectedCryptos) {
                            InfoButton(selectedCryptos: selectedCryptos, viewModel: viewModel, selectedTicker: $selectedTicker, navigateToDetail: $navigateToDetail)
                        }
                    }
                    
                    Spacer(minLength: 50)
                }
                .padding(.horizontal)
            }
            .safeAreaInset(edge: .top) { Spacer().frame(height: 20) } 
            .refreshable { await viewModel.fetchTickers() }
            .navigationTitle("Statistikk")
            .onAppear {
                animateIfNeeded(stats: stats, showMoneyAnimation: $showMoneyAnimation, settings: settings)
            }
            .overlay {
                if showMoneyAnimation {
                    MoneyAnimationView()
                        .transition(.opacity)
                        .zIndex(1) 
                }
            }
            .background(navigationDestinationView(navigateToDetail: $navigateToDetail, selectedTicker: selectedTicker))
        }
    }
}
