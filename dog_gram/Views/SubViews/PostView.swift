//
//  PostView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct PostView: View {
  @State var post: PostModel
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: Header
      HStack {
        Image("dog1")
          .resizable()
          .scaledToFill()
          .frame(width: 30, height: 30, alignment: .center)
          .cornerRadius(15)
        
        Text(post.username)
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(.primary)
        
        Spacer()
        
        Image(systemName: "ellipsis")
          .font(.headline)
        
      }
      .padding(.all, 6)
      
      // MARK: Image
      Image("dog1")
        .resizable()
        .scaledToFit()
      
      // MARK: Footer
      HStack(alignment: .center, spacing: 20) {
        Image(systemName: "heart")
        
        NavigationLink(
          destination: CommentsView(),
          label: { Image(systemName: "bubble.middle.bottom").foregroundColor(.primary) }
        )
        
        Image(systemName: "paperplane")
        Spacer()
      }
      .font(.title3)
      .padding(.all, 6)
      
      if let caption = post.caption {
        HStack {
          Text(caption)
          Spacer(minLength: 0)
        }
        .padding(.all, 6)
      }
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: dev.post)
      .previewLayout(.sizeThatFits)
  }
}
