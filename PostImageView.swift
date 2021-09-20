//
//  PostImageView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct PostImageView: View {
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.colorScheme) var colorScheme
  @State var captionText: String = ""
  @Binding var imageSelected: UIImage
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "xmark")
            .font(.title)
            .padding()
        })
        .accentColor(.primary)
        
        Spacer()
      }
      
      ScrollView(.vertical, showsIndicators: false) {
        Image(uiImage: imageSelected)
          .resizable()
          .scaledToFill()
          .frame(width: 200, height: 200, alignment: .center)
          .cornerRadius(12.0)
          .clipped()
        
        TextField("Add your caption here.", text: $captionText)
          .padding()
          .frame(height: 60)
          .frame(maxWidth: .infinity)
          .background(colorScheme == .light ? Color.app.beige : Color.app.purple)
          .cornerRadius(12.0)
          .font(.headline)
          .padding(.horizontal)
          .autocapitalization(.sentences)
        
        Button(action: {
          postPicture()
        }, label: {
          Text("Post picture".uppercased())
            .font(.title3)
            .fontWeight(.bold)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(colorScheme == .light ? Color.app.purple : Color.app.yellow)
            .cornerRadius(12.0)
            .padding(.horizontal)
        })
        .accentColor(colorScheme == .light ? Color.app.yellow : Color.app.purple)
      }
    }
  }
  
  private func postPicture() {
    print("POST TO DATABASE")
  }
}

struct PostImageView_Previews: PreviewProvider {
  @State static var image = UIImage(named: "dog2")!
  
  static var previews: some View {
    Group {
      PostImageView(imageSelected: $image)
        .preferredColorScheme(.dark)
      
      PostImageView(imageSelected: $image)
    }
  }
}
