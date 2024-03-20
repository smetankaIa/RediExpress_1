//
//  SwiftUIView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 19.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    
    var body: some View {
        VStack {
            SecureField("Enter password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    Text(String(repeating: "*", count: password.count))
                        .foregroundColor(.gray)
                        .padding(.leading, 5),
                    alignment: .leading
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

