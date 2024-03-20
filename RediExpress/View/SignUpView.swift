//
//  HolderView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 10.03.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State var fullname: String = ""
    @State var phoneNunber: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var confirmPassword: String = ""
    
    @State private var buttonColor = Color.gray
    @State  var colorRectangleEmail = Color.gray
    @State  var colorForegroundEmail = Color.black
    @State  var checkBoxColor = Color.blue
    @State var checkBoxBool = false
    
    @State var navigateBool = false

    
    @State private var isValidEmail: Bool = false
    
    var body: some View {
        
        VStack(spacing: 15) {
                Spacer()
                titleBar(mainText: "Create in Account", secondarytext: "Complete the sign up proccess to get started")
                textFieldBar(textOnTextField: "Full Name",
                             textFieldText: "Ivanov Ivan",
                             colorResctangle: .gray,
                             colorForeground: .black, eye: false,
                             varibleText: $fullname)
                            .onChange(of: fullname) {
                                    textIsEmpty()
            
                            }
                textFieldBar(textOnTextField: "Phone Number",
                             textFieldText: "+7(999)999-99-99",
                             colorResctangle: .gray,
                             colorForeground: .black, eye: false,
                             varibleText: $phoneNunber)
                            .keyboardType(.numberPad)
                            .onChange(of: phoneNunber) {
                                textIsEmpty()
                        
                                }

                textFieldBar(textOnTextField: "Email Addres",
                             textFieldText: "***********@mail.com",
                             colorResctangle: colorRectangleEmail,
                             colorForeground: colorForegroundEmail, eye: false,
                             varibleText: $email)
                        .keyboardType(.emailAddress)
                        .onChange(of: email) {
                            textIsEmpty()
                    
                            }
                textFieldBar(textOnTextField: "Password",
                             textFieldText: "**********",
                             colorResctangle: .gray,
                             colorForeground: .black, eye: true,
                             varibleText: $password)
                            .onChange(of: password) {
                                textIsEmpty()
            
                                }
                textFieldBar(textOnTextField: "Confirm Password",
                             textFieldText: "**********",
                             colorResctangle: .gray,
                             colorForeground: .black, eye: true,
                             varibleText: $confirmPassword)
                            .onChange(of: confirmPassword) {
                                textIsEmpty()
                                
                        }
                VStack(spacing: 5) {
                    privacyText
                    Spacer()
                    buttonIn(text: "Sign Up", color: buttonColor, needDest: true, destination: LogInView(), navigateBool: navigateBool)
                        .onTapGesture {
                        emailCheck()
                    }
                }
                bottomTextSigIn(color: .gray, mainText: "Already have an account?", action: {
                   
                }, textSign: "Sign In", googleBool: true, destination: LogInView())
                
            }
        
        .padding()
    }
}

#Preview {
    SignUpView()
}

extension SignUpView {
   
    
    private var privacyText: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 30) {
                VStack {
                    if checkBoxBool == false {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(checkBoxColor, lineWidth: 1)
                            .frame(width: 14, height: 14)
                            .padding(.bottom)
                            .onTapGesture {
                                toggleCheckBox()
                            }
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(.blue, lineWidth: 1)
                                .background(Color.blue)
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
                
                Text("By ticking this box, you agree to our \(Text("Terms and\n conditions and private policy").foregroundColor(.yellow))")
                    .font(.custom("Roboto-Regular", size: 12))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
    }
//    private var
    
}

//MARK: FUNCTION
extension SignUpView {
    private func emailCheck() {
        
        if email.isValidMail(){
                colorRectangleEmail = Color.gray
                colorForegroundEmail = Color.black
            } else {
                colorRectangleEmail = Color.red
                colorForegroundEmail = Color.red
            }
        }
    
    func textIsEmpty() {
        emailCheck()
        if !fullname.isEmpty && !phoneNunber.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword && checkBoxBool == true && email.isValidMail() {
            buttonColor = .blue
            navigateBool = true
        } else {
            navigateBool = false

             buttonColor = Color.gray

        }
    
    
    }
    func toggleCheckBox() {
        checkBoxBool.toggle()
    }
        
}
