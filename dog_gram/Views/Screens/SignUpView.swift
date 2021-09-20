//
//  SignUpView.swift
//  dog_gram
//
//  Created by Rick Brown on 19/09/2021.
//

import SwiftUI

struct SignUpView: View {
  @State var showOnboardView: Bool = false
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Spacer()
      
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
      
      Text("You are not signed in 😕")
        .font(.largeTitle)
        .fontWeight(.bold)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .foregroundColor(Color.app.purple)
      
      Text("Click the button below to create an account and join in the fun!! 🐶")
        .font(.headline)
        .fontWeight(.medium)
        .multilineTextAlignment(.center)
      
      Button(action: { showOnboardView.toggle() }, label: {
        Text("Sign in/ Sign up".uppercased())
          .font(.headline)
          .fontWeight(.bold)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.app.purple)
          .cornerRadius(12.0)
          .shadow(radius: 12.0)
      })
      .accentColor(Color.app.yellow)
      
      Spacer()
      Spacer()
    }
    .padding(.all, 40)
    .background(Color.app.yellow)
    .edgesIgnoringSafeArea(.all)
    .fullScreenCover(isPresented: $showOnboardView) { OnboardingView() }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
