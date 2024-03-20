//
//  OTPTextField.swift
//  RediExpress
//
//  Created by Алексей Никулин on 19.03.2024.
//

import SwiftUI

struct OTPTextField: View {
    @State var enterValue: [String]
    @State var colorBorder: Color
    @FocusState private var fieldFocus: Int?
//    init(numberOfFields: Int) {
//        self.numberOfFields = numberOfFields
//        self.enterValue = Array(repeating: "", count: numberOfFields)
//    }
        
   
    var body: some View {
        HStack(spacing: 30) {
            ForEach(0..<6, id: \.self) { index in
                TextField(" ", text: $enterValue[index])
                    .frame(width: 32, height: 32)
                    .border(colorBorder)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .focused ($fieldFocus, equals: index)
                    .tag (index) 
                    .onChange(of: enterValue[index]) { oldValue, newValue in
                        fieldFocus = (fieldFocus ?? 0) + 1
                        changeColorBorder()
                    }
                

            }
        }
       
    }
    
}

#Preview {
    OTPTextField(enterValue: Array(repeating: "", count: 6), colorBorder: .gray)
}

extension OTPTextField {
    private func changeColorBorder() {
        if !enterValue.isEmpty {
            colorBorder = Color.blue
        } else {
            
        }
    }
}
