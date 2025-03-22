//
//  InfoBoxView.swift
//  CryptoApp
//
//

//Infoboksene på hjem-skjermen

import SwiftUI

struct InfoBoxView: View {
    let infoItems: [(title: String, description: String)] = [
        ("📊 Markedsstatus", "Oversikt over markedets helsetilstand"),
        ("🪙 Antall Coins", "Totalt antall kryptovalutaer i markedet"),
        ("📈 Aktive Markeder", "Antall markeder med aktiv handel"),
        ("💰 Markedsverdi", "Den samlede verdien av alle kryptovalutaene"),
        ("📊 BTC Dominance", "Andelen av markedet som Bitcoin utgjør"),
        ("📉 Markedsendring", "Prosentvis endring i markedsverdien")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Informasjon")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(infoItems, id: \.title) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(width: 200) 
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                        )
                        .shadow(color: Color.blue.opacity(0.7), radius: 5, x: 0, y: 0)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
