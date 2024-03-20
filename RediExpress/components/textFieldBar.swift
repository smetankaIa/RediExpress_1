//
//  textFieldBar.swift
//  RediExpress
//
//  Created by Алексей Никулин on 14.03.2024.
//

import SwiftUI

struct textFieldBar: View {
    var textOnTextField: String
    var textFieldText: String
    var colorResctangle: Color
    var colorForeground: Color
    var eye: Bool 
@State  var hiddenPass = true
@Binding var varibleText: String
    var body: some View {
        VStack {
            HStack{
                
                Text(textOnTextField)
                    .font(.custom("Roboto-Regular", size: 14))
                    .foregroundColor(.secondary)
                    
                Spacer()
            }
            HStack {
                if eye == false {
                    TextField(textFieldText, text: $varibleText)
                        .font(.custom("Roboto-Regular", size: 14))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(colorForeground)
                        .padding(15)
                } else {
                    if hiddenPass == true {
                    SecureField(textFieldText, text: $varibleText)
                        .font(.custom("Roboto-Regular", size: 14))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(colorForeground)
                        .padding(15)
                    
                        Image("eye-slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14)
                            .padding(5)
                            .onTapGesture{
                                toggleEye()
                            }
                    } else {
                        TextField(textFieldText, text: $varibleText)
                            .font(.custom("Roboto-Regular", size: 14))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(colorForeground)
                            .padding(15)
                        Image("eye")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14)
                            .padding(5)
                            .onTapGesture{
                                toggleEye()
                            }
                    }
                }
            }.overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(colorResctangle, lineWidth: 1)
            }
//            HStack {
//                if eye == true {

//                }   else {
//                    SecureField(textFieldText, text: $varibleText)
//                        .font(.custom("Roboto-Regular", size: 14))
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(colorForeground)
//                        .padding(15)
//                }
//                    if hiddenPass == false {
//                        Image("")
//
//                    } else {
//                        Image("eye")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 17)
//                            .padding(5)
//                            .onTapGesture{
//                                toggleEye()
//                            }
//                    }
//                
//
//                    }

                
            
        }
    }
    func toggleEye() {
        hiddenPass.toggle()
    }
    

}

#Preview {
    textFieldBar(textOnTextField: "Full Name", textFieldText: "Ivanov Ivan", colorResctangle: .gray, colorForeground: .black, eye: true, varibleText: .constant(""))
}
