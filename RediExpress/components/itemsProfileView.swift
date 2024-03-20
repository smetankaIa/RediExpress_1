//
//  itemsProfileView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 20.03.2024.
//

import SwiftUI

struct itemsProfileView <T:View>: View {
    var image: String
    var mainText: String
    var destination: T
    var secondText: String
    var imageColor: Color
    var secondTextBool: Bool
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 62)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .overlay {
                            HStack {
                                Image(systemName: image)
                                    .foregroundColor(imageColor)
                                VStack {
                                    HStack {
                                        Text(mainText)
                                            .font(.custom("Roboto-Regular", size: 16))
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    if secondTextBool == true {
                                        HStack {
                                            Text(secondText)
                                                .font(.custom("Roboto-Regular", size: 12))
                                                .foregroundColor(.secondary)
                                            Spacer()
                                        }
                                    } else {
                                        EmptyView()
                                    }
                                }.frame(width: .infinity)
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                                    .padding(.leading, 25)
                                Spacer()
                            }.padding()
                            
                            
                        }
                }.padding(.horizontal)
        }
    
        
    }
}

#Preview {
    
    NavigationStack {
        itemsProfileView(image: "house", mainText: "Some Text", destination: LogInView(), secondText: "Some second text ...", imageColor: .black, secondTextBool: true)
    }
}
