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
      .sheet(isPresented: $showImagePicker, content: {
        ImagePicker(imageSelected: $imageSelected, sourceType: $sourcetype)
      })
      
      Image("logo.transparent")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100, alignment: .center)
        .shadow(radius: 12.0)
    }
    .edgesIgnoringSafeArea(.top)
  }
}

struct UploadView_Previews: PreviewProvider {
  static var previews: some View {
    UploadView()
  }
}
