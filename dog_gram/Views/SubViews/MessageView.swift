//
//  MessageView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct MessageView: View {
  @State var comment: CommentModel
  
  var body: some View {
    HStack {
      // MARK: Profile Image
      Image("dog1")
        .resizable()
        .scaledToFill()
        .frame(width: 40, height: 40, alignment: .center)
        .cornerRadius(20.0)
      
      VStack(alignment: .leading, spacing: 4) {
        // MARK: Username
        Text(comment.username)
          .font(.caption)
          .foregroundColor(.gray)
        
        // MARK: Content
        Text(comment.content)
          .padding(.all, 10)
          .foregroundColor(.primary)
          .background(Color.gray)
          .cornerRadius(10.0)
      }
      Spacer(minLength: 0)
    }
  }
}

struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView(comment: dev.comment)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
