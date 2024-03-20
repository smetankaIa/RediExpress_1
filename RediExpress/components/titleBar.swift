//
//  titleBar.swift
//  RediExpress
//
//  Created by Алексей Никулин on 14.03.2024.
//

import SwiftUI

struct titleBar: View {
    var mainText: String
    var secondarytext: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(mainText)
                    .font(.custom("Roboto-Medium", size: 24))
                    .padding(.trailing, 8.0)
                Spacer()
            }
                Text(secondarytext)
                    .font(.custom("Roboto-Regular", size: 14))
                    .foregroundColor(.gray)
            
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    titleBar(mainText: "Main text", secondarytext: "Secondary text")
}
