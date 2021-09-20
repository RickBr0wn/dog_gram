//
//  PostView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct PostView: View {
  @State var post: PostModel
  @State var postImage: UIImage = UIImage(named: "dog1")!
  var showHeaderAndFooter: Bool
  @State var animateLike: Bool = false
  @State var addHeartAnimationToView: Bool
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: Header
      if showHeaderAndFooter {
        HStack {
          NavigationLink(
            destination: ProfileView(displayName: post.username, profileUserID: post.userID, isMyProfile: false),
            label: {
              Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30, alignment: .center)
                .cornerRadius(15)
              
              Text(post.username)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.primary)
            })
          
          Spacer()
          
          Image(systemName: "ellipsis")
            .font(.headline)
          
        }
        .padding(.all, 6)
      }
      
      // MARK: Image

      ZStack {
        Image(uiImage: postImage)
          .resizable()
          .scaledToFit()
        
        if addHeartAnimationToView { LikeAnimationView(animate: $animateLike) }
      }
      
      // MARK: Footer
      if showHeaderAndFooter {
        HStack(alignment: .center, spacing: 20) {
          Button(action: { if post.isLikedByUser { unlikePosts() } else { likePosts() }},
                 label: { Image(systemName: post.isLikedByUser ? "heart.fill" : "heart") }
          )
          .accentColor(post.isLikedByUser ? .red : .primary)
          
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
  
  // MARK: Functions
  
  func likePosts() {
    let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, isLikedByUser: true)
    self.post = updatedPost
    
    animateLike = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { animateLike = false }
  }
  
  func unlikePosts() {
    let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, isLikedByUser: false)
    self.post = updatedPost
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: dev.post, showHeaderAndFooter: true, addHeartAnimationToView: true)
      .previewLayout(.sizeThatFits)
  }
}

