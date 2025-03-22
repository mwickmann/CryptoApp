import SwiftUI

struct SettingsHelpers {
    static func updateConversionRate(newValue: String, settings: AppSettings) {
        if let newRate = Double(newValue) {
            settings.conversionRate = newRate
        }
    }
    
    static func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                          to: nil,
                                          from: nil,
                                          for: nil)
    }
    
    static func saveSettings(emojiThresholdText: String,
                             settings: AppSettings,
                             setSaveMessage: @escaping (String) -> Void,
                             setShowEmojiThresholdAlert: @escaping (Bool) -> Void) {
        dismissKeyboard()
        
        if let newThreshold = Double(emojiThresholdText), newThreshold >= 1, newThreshold <= 100 {
            settings.emojiThreshold = newThreshold
            settings.saveToUserDefaults()
            setSaveMessage("Lagring fullført")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                setSaveMessage("")
            }
        } else {
            setShowEmojiThresholdAlert(true)
        }
    }
    
    static func loadSettings(settings: AppSettings,
                             conversionRateText: inout String,
                             emojiThresholdText: inout String) {
        settings.loadFromUserDefaults()
        conversionRateText = String(format: "%.2f", settings.conversionRate)
        emojiThresholdText = String(format: "%.0f", settings.emojiThreshold)
    }
}
