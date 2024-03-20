//
//  HomeView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 17.03.2024.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    let tabs = ["Home", "Wallet", "Track", "Profile"]
    
    let images = ["house","creditcard","car.ferry","person" ]
    
    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                Text("Content for Tab 1")
            case 1:
                WalletView()
            case 2:
                TrackView()
            case 3:
                ProfileView()
            default:
                EmptyView()
            }
            Spacer()
            ZStack {
                HStack(spacing: 0) {
                    ForEach(0..<tabs.count) { index in
                        Button(action: {
                            selectedTab = index
                        }) {
                            VStack {
                                Rectangle()
                                    .frame(width: 45,height: 2)
                                    .foregroundColor(selectedTab == index ? .blue : .clear)
                                    .padding(.horizontal)
                                Image(systemName: images[index])
                                    .padding(3)
                                    .foregroundColor(selectedTab == index ? .blue : .gray)
                                Text(tabs[index])
                                    .font(.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(selectedTab == index ? .blue : .gray)
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    Spacer()
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }.padding(.bottom, 0)
                .ignoresSafeArea(.all)

            
            
            
            
            
        }
    }
}

                      

#Preview {
    CustomTabView()
}
