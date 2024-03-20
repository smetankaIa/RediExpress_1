//
//  signUpButton.swift
//  RediExpress
//
//  Created by Алексей Никулин on 13.03.2024.
//

import SwiftUI

struct buttonIn <T:View>:   View {
    var text: String
    var color: Color
    var needDest: Bool
    var destination: T
    var navigateBool: Bool
    @State var isNavigate: Bool = false
     var body: some View {
         VStack {
             if needDest == false{
                 NavigationLink {
                     destination
                 } label: {
                     Text(text)
                         .font(.custom("Roboto-Bold",  size: 16))
                         .foregroundColor(.white)
                         .frame(width: 342,height: 50)
                         .background(color)
                         .cornerRadius(4.69)
                         .padding(0.9)
                         .cornerRadius(4.69)
                 }
             } else {
                 Button {
                     if navigateBool == true {
                         isNavigate = true
                     }
                 } label: {
                     Text(text)
                         .font(.custom("Roboto-Bold",  size: 16))
                         .foregroundColor(.white)
                         .frame(width: 342,height: 50)
                         .background(color)
                         .cornerRadius(4.69)
                         .padding(0.9)
                         .cornerRadius(4.69)
                 }
                 NavigationLink(destination: destination, isActive: $isNavigate) {
                     EmptyView()
                 }
             }


         }.navigationBarBackButtonHidden()
        }
    }

#Preview {
    NavigationStack {
        buttonIn(text: "Text", color: .blue, needDest: true, destination: SignUpView(), navigateBool: true)
    }
        
}
