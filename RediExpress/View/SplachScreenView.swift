//
//  SplachScreenView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 20.03.2024.
//

import SwiftUI

struct SplachScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            withAnimation(.easeOut){
                OnboardingView(onboardingState: .constant(0))
            }
        } else {
            VStack {
                VStack {
                    Image("splash")
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    SplachScreenView()
}
