//
//  ForgotPasswordView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 14.03.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
@State var forgotPassEmail: String = ""
@State private var buttonColor = Color.gray
    @State  var colorRectangle = Color.gray
    @State  var colorForeground = Color.black
    @State  var navigateBool = false
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            titleBar(mainText: "Forgot Password", secondarytext: "Enter your email addres")
            
            textFieldBar(textOnTextField: "Email Addres", textFieldText: "***********@mail.com", colorResctangle: colorRectangle, colorForeground: colorForeground, eye: false, varibleText: $forgotPassEmail)
                .onChange(of: forgotPassEmail) {
                    textIsEmpty()

            }
            
            VStack(spacing: 15) {
                buttonIn(text: "Send OTP", color: buttonColor, needDest: true, destination: OTPView(), navigateBool: navigateBool)
                    .onTapGesture {
                        isValidEmail()
                    }
                bottomTextSigIn(color: .gray, mainText: "Remember password? Back to ", action: {
                    
                }, textSign: "Sign In", googleBool: false, destination: LogInView())
            }
            Spacer()
            Spacer()
            }.padding()
        }
}

#Preview {
    ForgotPasswordView()
}

extension ForgotPasswordView {
    private func isValidEmail() {
        
        if forgotPassEmail.isValidMail() {
                buttonColor = Color.blue
                colorRectangle = Color.gray
                colorForeground = Color.black
            } else {
                buttonColor = Color.gray
                colorRectangle = Color.red
                colorForeground = Color.red
            }
        }
    func textIsEmpty () {
        isValidEmail()
        if !forgotPassEmail.isEmpty && forgotPassEmail.isValidMail() {
            navigateBool = true
            buttonColor = .blue
        } else {
            navigateBool = false
            buttonColor = .gray
        }
    }
    
}
