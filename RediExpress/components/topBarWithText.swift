//
//  topBarWithText.swift
//  RediExpress
//
//  Created by Алексей Никулин on 20.03.2024.
//

import SwiftUI

struct topBarWithText: View {
     var text: String
    var body: some View {
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 98)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .overlay {
                        Text(text)
                            .font(.custom("Roboto-Regular", size: 16))
                            .foregroundColor(.gray)
                            .padding(.top, 50)
                    }
        }.ignoresSafeArea()
    }
}

#Preview {
    topBarWithText(text: "text")
}
