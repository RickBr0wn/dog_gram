//
//  SettingsView.swift
//  dog_gram
//
//  Created by Rick Brown on 17/09/2021.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        
        // MARK: Welcome
        
        GroupBox(label: SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")) {
          HStack(alignment: .center, spacing: 10) {
            Image("logo")
              .resizable()
              .scaledToFit()
              .frame(width: 80, height: 80, alignment: .center)
              .cornerRadius(12.0)
            
            Text("DogGram is the number one app for posting pictures of your dog and sharing them across the world.\nWe are a dog loving community, and we are really happy that you have joined us. We cannot wait to see all of your dog pictures!! 🐾")
              .font(.footnote)
          }
        }
        
        
        // MARK: Profile
        
        GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill")) {
          NavigationLink(
            destination: SettingsEditTextView(submissionText: "Current Display Name", title: "Display Name", description: "You can edit your display name here. Its this username that will be seen by other users on your profile and on all of your posts.", placeholder: "Enter a new display name."),
            label: { SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.app.purple) }
          )
          NavigationLink(
            destination: SettingsEditTextView(submissionText: "Current bio", title: "Profile Bio", description: "Your bio is a great way to let other users know a little about you. It will be shown on your profile only.", placeholder: "Enter a new bio"),
            label: { SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.app.purple) }
          )
          SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.app.purple)
          SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: Color.app.purple)
        }
        
        // MARK: Application
        
        GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
          SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.app.yellow)
          SettingsRowView(leftIcon: "folder.fill", text: "Terms and Conditions", color: Color.app.yellow)
          SettingsRowView(leftIcon: "globe", text: "Developer Website", color: Color.app.yellow)
        }
        
        // MARK: Sign Off
        
        GroupBox(label: SettingsLabelView(labelText: "Developer", labelImage: "person.crop.circle")) {
          SettingsRowView(leftIcon: "person.crop.circle", text: "Rick Brown", color: Color.app.purple)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .padding(.bottom, 80)
      }
      .navigationBarTitle("Settings")
      .navigationBarTitleDisplayMode(.large)
      .navigationBarItems(leading: Button(action: {
        presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "xmark")
          .font(.title)
          .accentColor(.primary)
      }))
    }
    .padding()
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
