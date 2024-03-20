//
//  signUpButton.swift
//  RediExpress
//
//  Created by Алексей Никулин on 13.03.2024.
//

import SwiftUI

struct buttonIn: View {
    var color: Color
    var action: () -> Void
     var body: some View {
         
        Text("Sign Up")
            .font(.custom("Roboto-Bold",  size: 16))
            .foregroundColor(.white)
            .frame(width: 342,height: 50)
            .background(color)
            .cornerRadius(4.69)
            .padding(0.9)
            .cornerRadius(4.69)
            .onTapGesture {
            action()
            }
        }
    }

#Preview {
    buttonIn(color: .blue) {
        
    }
}
