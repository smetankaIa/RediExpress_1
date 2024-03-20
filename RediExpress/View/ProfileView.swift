//
//  ProfileView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 20.03.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
                topBarWithText(text: "Profile")
            ScrollView {
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .black, secondTextBool: true)
                    itemsProfileView(image: "house", mainText: "text", destination: LogInView(), secondText: "text", imageColor: .red, secondTextBool: false)
                
                
                
            }
        }.frame(width: .infinity)
            
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
