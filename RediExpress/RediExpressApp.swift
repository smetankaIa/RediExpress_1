//
//  RediExpressApp.swift
//  RediExpress
//
//  Created by Алексей Никулин on 10.03.2024.
//

import SwiftUI

@main
struct RediExpressApp: App {
    
    @AppStorage("currentScreen") var currentScreen = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplachScreenView()
//                OnboardingView(onboardingState: $currentScreen)
            }
        }
    }
}
