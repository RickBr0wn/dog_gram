//
//  SettingsEditTextView.swift
//  dog_gram
//
//  Created by Rick Brown on 17/09/2021.
//

import SwiftUI

struct SettingsEditTextView: View {
  @State var submissionText: String = ""
  @State var title: String
  @State var description: String
  @State var placeholder: String
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    VStack {
      HStack {
        Text(description)
        
        Spacer(minLength: 0)
      }
      
      TextField(placeholder, text: $submissionText)
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(colorScheme == .light ? Color.app.beige : Color.app.purple)
        .cornerRadius(12.0)
        .font(.headline)
        .autocapitalization(.sentences)
      
      Button(action: {}, label: {
        Text("Save".uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(colorScheme == .light ? Color.app.purple : Color.app.yellow)
          .cornerRadius(12.0)
      })
      .accentColor(colorScheme == .light ? Color.app.yellow : Color.app.purple)
      
      Spacer()
    }
    .navigationBarTitle(title)
    .padding()
  }
}

struct SettingsEditTextView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Group {
        SettingsEditTextView(title: dev.title, description: dev.description, placeholder: dev.placeholder)
          .preferredColorScheme(.dark)
        
        SettingsEditTextView(title: dev.title, description: dev.description, placeholder: dev.placeholder)
      }
    }
  }
}
