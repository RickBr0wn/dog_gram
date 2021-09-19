//
//  OnboardingView.swift
//  dog_gram
//
//  Created by Rick Brown on 19/09/2021.
//

import SwiftUI

struct OnboardingView: View {
  var body: some View {
    VStack(spacing: 10) {
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .cornerRadius(12.0)
      
      Text("Welcome to dogGram!")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(Color.app.purple)
      
      Text("DogGram is the number one app for posting pictures of your dog and sharing them across the world.\nWe are a dog loving community, and we are really happy that you have joined us. We cannot wait to see all of your dog pictures!! 🐾")
        .font(.headline)
        .fontWeight(.medium)
        .multilineTextAlignment(.center)
        .foregroundColor(Color.app.purple)
        .padding()
      
      Button(action: {}, label: {
        SignInWithAppleButtonCustom()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .cornerRadius(12.0)
      })
      
      Button(action: {}, label: {
        HStack {
          Image(systemName: "globe")
          
          Text("Sign in with Google")
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .font(.system(size: 23.0, weight: .medium, design: .default))
        .background(Color(.sRGB, red: 255/255, green: 82/255, blue: 70/255, opacity: 1.0))
        .cornerRadius(12.0)
      })
      .accentColor(Color.white)
    }
    .padding(.all, 20)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.app.beige)
    .edgesIgnoringSafeArea(.all)
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
