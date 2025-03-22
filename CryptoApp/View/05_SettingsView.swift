import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: AppSettings
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var conversionRateText: String = ""
    @State private var emojiThresholdText: String = ""
    @State private var saveMessage: String = ""
    @State private var showEmojiThresholdAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Utseende")) {
                        Toggle("Mørk modus", isOn: $isDarkMode)
                    }
                    
                    Section(header: Text("Valutainnstillinger")) {
                        Toggle("Vis priser i NOK", isOn: $settings.displayInNOK)
                            .onChange(of: settings.displayInNOK) { newValue, _ in
                                settings.saveToUserDefaults()
                            }
                        
                        HStack {
                            Text("USD → NOK:")
                            TextField("10.5", text: $conversionRateText)
                                .keyboardType(.decimalPad)
                                .onChange(of: conversionRateText) { newValue, _ in
                                    SettingsHelpers.updateConversionRate(newValue: newValue, settings: settings)
                                }
                        }
                        Text("Alle dollarpriser vil bli konvertert til NOK basert på denne kursen.")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Section(header: Text("Emoji-animasjon")) {
                        HStack {
                            Text("Terskel (%):")
                            TextField("5", text: $emojiThresholdText)
                                .keyboardType(.numberPad)
                        }
                    }

                    Section {
                        Button(action: {
                            SettingsHelpers.saveSettings(emojiThresholdText: emojiThresholdText,
                                                         settings: settings,
                                                         setSaveMessage: { newMessage in
                                                            saveMessage = newMessage
                                                         },
                                                         setShowEmojiThresholdAlert: { flag in
                                                            showEmojiThresholdAlert = flag
                                                         })
                        }) {
                            Text("LAGRE")
                                .fontWeight(.light)
                                .frame(width: 250, height: 50)
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                        .buttonStyle(PlainButtonStyle())

                        if !saveMessage.isEmpty {
                            Text(saveMessage)
                                .foregroundColor(.green)
                                .padding(.top, 4)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollDismissesKeyboard(.interactively)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .alert("Du må taste inn et gyldig tall mellom 1-100", isPresented: $showEmojiThresholdAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .navigationTitle("Innstillinger")
            .onAppear {
                SettingsHelpers.loadSettings(settings: settings,
                                             conversionRateText: &conversionRateText,
                                             emojiThresholdText: &emojiThresholdText)
            }
        }
    }
}
