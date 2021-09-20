//
//  UploadView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI
import UIKit

struct UploadView: View {
  @State var showImagePicker: Bool = false
  @State var imageSelected: UIImage = UIImage(named: "logo")!
  @State var sourcetype: UIImagePickerController.SourceType = .camera
  @State var showPostImageView: Bool = false
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      VStack {
        Button(action: {
          sourcetype = UIImagePickerController.SourceType.camera
          showImagePicker.toggle()
        }, label: {
          Text("Take photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.app.yellow)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.app.purple)
        
        Button(action: {
          sourcetype = UIImagePickerController.SourceType.photoLibrary
          showImagePicker.toggle()
        }, label: {
          Text("Import photo".uppercased())
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.app.purple)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.app.yellow)
      }
      .sheet(isPresented: $showImagePicker, onDismiss: moveToPostImageView, content: {
        ImagePicker(imageSelected: $imageSelected, sourceType: $sourcetype)
          .preferredColorScheme(colorScheme)
          .accentColor(colorScheme == .light ? Color.app.purple : Color.app.yellow)
      })
      
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(radius: 12.0)
        .fullScreenCover(isPresented: $showPostImageView, content: {
          PostImageView(imageSelected: $imageSelected)
            .preferredColorScheme(colorScheme)
        })
    }
    .edgesIgnoringSafeArea(.top)
  }
  
  // MARK: Functions
  
  private func moveToPostImageView() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      showPostImageView.toggle()
    }
  }
}

struct UploadView_Previews: PreviewProvider {
  static var previews: some View {
    UploadView()
      .preferredColorScheme(.dark)
  }
}
