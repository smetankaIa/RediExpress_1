//
//  bottomTextSigIn.swift
//  RediExpress
//
//  Created by Алексей Никулин on 13.03.2024.
//

import SwiftUI

struct bottomTextSigIn: View {
    var body: some View {
        HStack {
            Text("Already have an account?")
                .font(.custom("Roboto-Regular",  size: 14))
            Text("Sign In")
                .font(.custom("Roboto-Medium",  size: 14))
                .foregroundColor(.blue)
                .onTapGesture {
                    //Sign In
                }
        }
    }
}

#Preview {
    bottomTextSigIn()
}
