//
//  CommentsView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct CommentsView: View {
  @State private var submissionText: String = ""
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack {
          Text("PLACEHOLDER")
        }
      }
      
      HStack {
        Image("dog1")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40, alignment: .center)
          .padding(.leading, 6)
          .cornerRadius(20)
        
        TextField("Add a comment here", text: $submissionText)
        
        Button(action: {}, label: {
          Image(systemName: "paperplane.fill")
            .font(.title2)
        })
        .accentColor(Color.app.purple)
        .padding(.trailing, 6)
      }
      .padding(.all, 6)
    }
    .navigationBarTitle("Comments")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct CommentsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      CommentsView()
    }
  }
}
