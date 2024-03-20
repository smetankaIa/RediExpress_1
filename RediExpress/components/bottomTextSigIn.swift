//
//  bottomTextSigIn.swift
//  RediExpress
//
//  Created by Алексей Никулин on 13.03.2024.
//

import SwiftUI

struct bottomTextSigIn <T:View>:   View {
    var color: Color
    var mainText: String
    var action: () -> Void
    var textSign: String
    var googleBool: Bool
    var destination: T
    var body: some View {
        
        VStack(spacing: 15) {
            HStack(spacing: 0) {
                Text(mainText)
                    .font(.custom("Roboto-Regular",  size: 14))
                    .foregroundColor(color)
                NavigationLink(textSign, destination: destination)
                    .font(.custom("Roboto-Medium",  size: 14))
                    .foregroundColor(.blue)
                    .onTapGesture {
                        action()
                    }
                
            }
            
            if googleBool == true {
                VStack {
                    Text("or sign in using")
                        .font(.custom("Roboto-Regular", size: 12))
                        .foregroundColor(.gray)
                    Image("google")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .onTapGesture {
                            
                        }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack {
        bottomTextSigIn(color: .gray, mainText: "Already have an account?", action: {
            
        }, textSign: "Sign In", googleBool: true, destination: SignUpView())
    }
}
