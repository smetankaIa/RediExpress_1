//
//  LogIn.swift
//  RediExpress
//
//  Created by Алексей Никулин on 14.03.2024.
//

import SwiftUI

struct LogInView: View {
    
    @State var logInEmail: String = ""
    @State var password: String = ""
    @State private var buttonColor = Color.gray
    @State  var colorRectangleEmail = Color.gray
    @State  var colorForegroundEmail = Color.black
    @State  var rememberPasswordBool: Bool = false
    @State var navaigateBool = false
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            titleBar(mainText: "Welcome back", secondarytext: "Fill in your email and password to continue")
            textFieldBar(textOnTextField: "Email Addres", textFieldText: "***********@mail.com", colorResctangle: colorRectangleEmail, colorForeground: colorForegroundEmail, eye: false, varibleText: $logInEmail)
                .onChange(of: logInEmail) {
                    textIsEmpty()

                }
            textFieldBar(textOnTextField: "Password", textFieldText: "**********", colorResctangle: .gray, colorForeground: .black, eye: true, varibleText: $password)
                .onChange(of:password) {
                    textIsEmpty()
                }
            rememberPasswordBar
            Spacer()
            buttonIn(text: "Log In", color: buttonColor, needDest: true, destination: CustomTabView(), navigateBool: navaigateBool)
                .onTapGesture {
                    emailIsValid()
                }
            bottomTextSigIn(color: .gray, mainText: "Already have an account?", action: {
                
            }, textSign: "Sign Up", googleBool: true, destination: SignUpView())
            Spacer()
            
        }.padding()
        }
}

#Preview {
    LogInView()
}

extension LogInView {
    private var rememberPasswordBar: some View {
        HStack {
            VStack {
                if rememberPasswordBool == false {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 14, height: 14)
                        .padding(.bottom)
                        .onTapGesture {
                            toggleCheckBox()
                        }
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.gray, lineWidth: 1)
                            .background(Color.gray)
                            .frame(width: 14, height: 14)
                            .padding(.bottom)
                        Image("check")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 7 , height: 7)
                            .padding(.bottom)
                       
                    }.onTapGesture {
                        toggleCheckBox()
                    }
                }
                
            }
            HStack {
                Text("Remember Password")
                    .font(.custom("Roboto-Regular", size: 12))
                    .foregroundColor(.gray)
                Spacer()
                NavigationLink("Forgor Password?", destination: ForgotPasswordView())
                    .font(.custom("Roboto-Medium", size: 12))
                    .foregroundColor(.blue)
            }.padding(.bottom, 15)
        }.padding(.leading, 5)
    }
}
extension LogInView {
    
    private func emailIsValid() {
        
        if logInEmail.isValidMail() {
                buttonColor = Color.blue
                colorRectangleEmail = Color.gray
                colorForegroundEmail = Color.black
            } else {
                buttonColor = Color.gray
                colorRectangleEmail = Color.red
                colorForegroundEmail = Color.red
            }
        }
    
    func textIsEmpty() {
        emailIsValid()
        if !logInEmail.isEmpty && !password.isEmpty && logInEmail.isValidMail() {
            navaigateBool = true
            buttonColor = .blue
        } else {
            buttonColor = .gray
            navaigateBool = false
        }
    }
    
    func toggleCheckBox() {
        rememberPasswordBool.toggle()
    }
    
}
