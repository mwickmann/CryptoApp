import SwiftUI
import Charts

struct TickersListView: View {
    @StateObject var viewModel = TickersViewModel()
    @EnvironmentObject var settings: AppSettings
    @State private var searchText: String = ""
    @State private var selectedPeriod: String = "1h"
    
    var sortedTickers: [CryptoTicker] {
        sortTickers(viewModel.tickers, by: viewModel.sortOption, ascending: viewModel.sortAscending)
    }
    
    var filteredTickers: [CryptoTicker] {
        filterTickers(sortedTickers, by: searchText)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                SortingHeaderButtons(sortOption: $viewModel.sortOption) {
                    viewModel.sortTickers()
                }
                .padding(.top, 8)
                
                Picker("Rekkefølge", selection: $viewModel.sortAscending) {
                    Text("Stigende").tag(true)
                    Text("Synkende").tag(false)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: viewModel.sortAscending) { _, _ in
                    viewModel.sortTickers()
                }
                
                List(filteredTickers) { ticker in
                    TickerRowView(ticker: ticker, selectedPeriod: selectedPeriod)
                        .environmentObject(settings)
                        .background(
                            NavigationLink(destination: TickerDetailView(ticker: ticker)) {
                                EmptyView()
                            }
                            .opacity(0) 
                        )
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Kryptovalutaer")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Søk etter kryptovaluta")
            .task {
                await viewModel.fetchTickers()
            }
            .padding(.horizontal)
        }
    }
}
