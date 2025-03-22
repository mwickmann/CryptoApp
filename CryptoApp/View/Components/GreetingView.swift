//
//  GreetingView.swift
//  CryptoApp
//
//

import SwiftUI

struct GreetingView: View {
    var body: some View {
        Text(greetingMessage())
            .font(.largeTitle)
            .bold()
            .padding(.leading)
            .padding(.top, 50)
            .padding(.bottom, 20)
    }
    
    private func greetingMessage() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<11:
            return "💰 God morgen!"
        case 11..<15:
            return "💰 God formiddag!"
        case 15..<18:
            return "💰 God ettermiddag!"
        default:
            return "💰 God kveld!"
        }
    }
}
