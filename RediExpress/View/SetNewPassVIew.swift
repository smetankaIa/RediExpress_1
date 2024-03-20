//
//  SetNewPassVIew.swift
//  RediExpress
//
//  Created by Алексей Никулин on 19.03.2024.
//

import SwiftUI

struct SetNewPassVIew: View {
    @State var buttonColor = Color.gray
    @State var password: String = ""
    @State var confPassword: String = ""
    @State var navigateBool = false
    
    var body: some View {
        VStack(spacing: 65) {
            Spacer()
            titleBar(mainText: "New Password", secondarytext: "Enter New Password")
            VStack(spacing: 25) {
                textFieldBar(textOnTextField: "Password", textFieldText: "********", colorResctangle: .gray, colorForeground: .black, eye: true, varibleText: $password)
                    .onChange(of: password){
                        textIsEmpty()
                    }
                textFieldBar(textOnTextField: "Confirm password", textFieldText: "********", colorResctangle: .gray, colorForeground: .black, eye: true, varibleText: $confPassword)
                    .onChange(of: confPassword){
                        textIsEmpty()
                    }
            }
            buttonIn(text: "Log In", color: buttonColor, needDest: true, destination: CustomTabView(), navigateBool: navigateBool)
            Spacer()
            Spacer()
        }.padding()
    }
}

#Preview {
    SetNewPassVIew()
}

extension SetNewPassVIew {
    func textIsEmpty() {
        if !password.isEmpty && !confPassword.isEmpty && password == confPassword {
            navigateBool = true
            buttonColor = .blue
        } else {
            navigateBool = false
            buttonColor = .gray
            
        }
    }
}
