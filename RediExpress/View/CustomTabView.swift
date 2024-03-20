//
//  HomeView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 17.03.2024.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height: 50)
            TabView {
                LogInView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(1)
                WalletView()
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Wallet")
                    }.tag(2)
                TrackView()
                    .tabItem {
                        Image(systemName: "car.front.waves.up.fill")
                        Text("Track")
                    }.tag(3)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profle")
                    }.tag(4)
                
            }.shadow(radius: 50)
        }
    }
    }
                      

#Preview {
    CustomTabView()
}
