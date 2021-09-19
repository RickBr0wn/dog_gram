//
//  SettingsEditImageView.swift
//  dog_gram
//
//  Created by Rick Brown on 19/09/2021.
//

import SwiftUI

struct SettingsEditImageView: View {
  @State var title: String
  @State var description: String
  // This is the image currently displayed on the screen
  @State var selectedImage: UIImage
  @State var showImagePicker: Bool = false
  @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Text(description)
        
        Spacer(minLength: 0)
      }
      
      Image(uiImage: selectedImage
      )
        .resizable()
        .scaledToFill()
        .frame(width: 200, height: 200, alignment: .center)
        .clipped()
        .cornerRadius(12.0)
      
      Button(action: {
        showImagePicker.toggle()
      }, label: {
        Text("Import".uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.app.yellow)
          .cornerRadius(12.0)
      })
      .accentColor(Color.app.purple)
      .sheet(isPresented: $showImagePicker) {
        ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
      }
      
      Button(action: {}, label: {
        Text("Save".uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(Color.app.purple)
          .cornerRadius(12.0)
      })
      .accentColor(Color.app.yellow)
      
      Spacer()
    }
    .navigationBarTitle(title)
    .padding()
  }
}

struct SettingsEditImageView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsEditImageView(title: dev.title, description: dev.description, selectedImage: UIImage(named: "dog1")!)
    }
  }
}
