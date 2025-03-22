import SwiftUI

// Onboarding første gang bruker åpner appen
struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    let onboardingData: [(title: String, description: String)] = [
        ("Velkommen til CryptoApp!", "Følg med på kryptomarkedet i sanntid."),
        ("Personlig oversikt", "Få oppdateringer om favorittvalutaene dine."),
        ("Enkel og brukervennlig", "Se markedsendringer med detaljerte grafer.")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Image("onboarding")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.4))
                
                VStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<onboardingData.count, id: \.self) { index in
                            VStack {
                                Spacer()
                                
                                Text(onboardingData[index].title)
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.top, 20)

                                Text(onboardingData[index].description)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 40)
                                
                                Spacer()
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                    Spacer()

                    if currentPage == onboardingData.count - 1 {
                        Button(action: {
                            hasSeenOnboarding = true
                        }) {
                            Text("KOM I GANG")
                                .fontWeight(.light)
                                .frame(width: 250, height: 50)
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                    } else {
                        Button("Hopp over") {
                            hasSeenOnboarding = true
                        }
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
