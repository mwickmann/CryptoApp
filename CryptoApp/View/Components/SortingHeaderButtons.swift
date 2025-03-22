import SwiftUI

struct SortingHeaderButtons: View {
    @Binding var sortOption: TickersViewModel.SortOption
    var sortAction: () -> Void

    let sortOptions: [(title: String, option: TickersViewModel.SortOption)] = [
        ("Rangering", .rank),
        ("Endring siste timen", .change1h),
        ("Endring siste døgnet", .change24h),
        ("Endring siste uken", .change7d)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(sortOptions, id: \.option) { item in
                    GlowingButton(title: item.title, isSelected: sortOption == item.option) {
                        sortOption = item.option
                        sortAction()
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
