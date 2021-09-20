//
//  AnotherOnboardingView.swift
//  dog_gram
//
//  Created by Rick Brown on 20/09/2021.
//

import SwiftUI

struct AnotherOnboardingView: View {
  @State var displayName: String = ""
  @State var showImagePicker: Bool = false
  @State var imageSelected: UIImage = UIImage(named: "logo")!
  @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("Whats your name?")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color.app.yellow)
      
      TextField("Add your name here..", text: $displayName)
        .padding()
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.app.beige)
        .cornerRadius(12.0)
        .font(.headline)
        .autocapitalization(.sentences)
        .padding(.horizontal)
      
      Button(action: { showImagePicker.toggle() }, label: {
        Text("Add profile picture..".uppercased())
          .font(.headline)
          .fontWeight(.bold)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.app.yellow)
          .cornerRadius(12.0)
          .padding(.horizontal)
      })
      .accentColor(Color.app.purple)
      .opacity(displayName != "" ? 1.0 : 0.0)
      .animation(.easeOut(duration: 1.0))
      
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.app.purple)
    .edgesIgnoringSafeArea(.all)
    .sheet(isPresented: $showImagePicker, onDismiss: createProfile, content: { ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType) })
  }
  
  // MARK: Functions
  
  func createProfile() {
    print("Create profile now!!")
  }
}

struct AnotherOnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    AnotherOnboardingView()
  }
}
