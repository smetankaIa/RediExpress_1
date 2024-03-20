//
//  ContentView.swift
//  RediExpress
//
//  Created by Алексей Никулин on 10.03.2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var onboardingState: Int 
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    var body: some View {
        VStack {
            switch onboardingState {
            case 0:
                firstOnboardSection
                    .transition(transition)
            case 1:
                secondOnboardSection
                    .transition(transition)
            case 2:
                thirdOnboardSection
                        .transition(transition)
            case 3:
                SignUpView()
                    .transition(transition)
            default:  RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.green)
                
            }
                Spacer()
            if onboardingState  < 2{
                bottomButtons
            } else if onboardingState == 2{
                buttonIn(text: "Sign Up", color: .blue, needDest: false, destination: SignUpView(), navigateBool: true)
                  
                bottomTextSigIn(color: .black, mainText: "Already have an account?", action: {
                    
                }, textSign: "Sign In", googleBool: false, destination: LogInView())
                Spacer()
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        OnboardingView(onboardingState: .constant(0))
    }
}
//MARK: SECTION
extension OnboardingView {
    private var bottomButtons: some View {
        HStack(spacing: 142) {
            NavigationLink("Skip", destination: SignUpView())
                .font(.custom("Roboto",  size: 14))
                .foregroundColor(.blue)
                .frame(width: 100,height: 50)
                .background(.white)
                .cornerRadius(4.69)
                .padding(0.9)
                .background(.blue)
                .cornerRadius(4.69)
                .onTapGesture{
                    hanleSkipButtonPressed()

                }
            Text("Next")
                .font(.custom("Roboto", size: 14))
                .foregroundColor(.white)
                .frame(width: 100, height: 55)
                .background(Color.blue)
                .cornerRadius(4.69)
                .onTapGesture{
                    handleNextButtonPressed()
                }
                .onAppear {
                    onboardingState = UserDefaults.standard.integer(forKey: "currentScreen")
                }
                .onDisappear {
                    UserDefaults.standard.set(onboardingState, forKey: "currentScreen")
                }
        }.padding(.bottom)
    }
    
    
    private var firstOnboardSection: some View {
        VStack{
            Spacer()
            Image("OnboardImg-1")
                    .resizable()
                    .frame(width: 346, height: 346)
                    .padding()
            Text("Quick Delivery At\n Your Doorstep")
                    .font(.custom("Roboto-Bold", fixedSize: 24))
                    .foregroundColor(.blue)
                    .padding(4)
            Text("Enjoy quick pick-up and delivery to\n your destination")
                    .font(.custom("Roboto", fixedSize: 16))
            Spacer()
            Spacer()
            
        }.multilineTextAlignment(.center)
    }
    
    private var secondOnboardSection: some View {
        VStack{
            Spacer()
            Image("OnboardImg-2")
                    .resizable()
                    .frame(width: 424, height: 315.93)
                    .padding()
            Text("Flexible Payment")
                    .font(.custom("Roboto-Bold", fixedSize: 24))
                    .foregroundColor(.blue)
                    .padding(4)
            Text("Different modes of payment either\n before and after delivery without\n stress")
                    .font(.custom("Roboto", fixedSize: 16))
            Spacer()
            Spacer()
            
        }.multilineTextAlignment(.center)
    }
    
    private var thirdOnboardSection: some View {
        VStack{
            Spacer()
            Image("OnboardImg-3")
                    .resizable()
                    .frame(width: 399.94, height: 298)
                    .padding()
            Text("Real-time Tracking")
                    .font(.custom("Roboto-Bold", fixedSize: 24))
                    .foregroundColor(.blue)
                    .padding(4)
            Text("Track your packages/items from the\n comfort of your home till final destination")
                    .font(.custom("Roboto", fixedSize: 16))
            Spacer()
            Spacer()
            
        }.multilineTextAlignment(.center)
    }
}


//MARK: FUNC
extension OnboardingView {
    
    func handleNextButtonPressed() {
            withAnimation(.spring()) {
                onboardingState += 1
        }
    }
    func hanleSkipButtonPressed() {
        withAnimation(.spring) {
            onboardingState = 3
        }
    }
   
}
