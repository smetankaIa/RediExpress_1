//
//  OTPView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 19.03.2024.
//

import SwiftUI

struct OTPView: View {
@State    var colorResend: Color = Color.gray
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date()) ?? Date()
    
        var body: some View {
        VStack(spacing: 40) {
            Spacer()
            titleBar(mainText: "OTP Verification", secondarytext: "Enter the 6 digit numbers sent to your email")
            OTPTextField(enterValue:  Array(repeating: "", count: 6), colorBorder: .gray)
            timerText
            buttonIn(text: "Set New Password", color: .gray, needDest: true, destination: SetNewPassVIew(), navigateBool: true)
            
            Spacer()
            Spacer()
        }.padding()
    }
}

#Preview {
    OTPView()
}
extension OTPView {
    private var timerText: some View {
        HStack(spacing: 0) {
            Text("If you didn’t receive code, ")
                .foregroundColor(.secondary)
            HStack {
                Text( "\(timeRemaining)")
                    .foregroundColor(colorResend)
            }.onTapGesture {
                print("code")
            }

        }
        .font(.custom("Roboto-Regular", size: 14))
        .onReceive(timer, perform: { _ in
            updateTimeRamining()
                
        })
    }
    
    func updateTimeRamining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "resend after \(minute):\(second)"
        if timeRemaining == "resend after 0:0" {
            timer.upstream.connect().cancel()
            timeRemaining = "resend"
            colorResend = .blue
                
        }
    }
    

}
