//
//  PostView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct PostView: View {
  @State var post: PostModel
  var showHeaderAndFooter: Bool
  @State var animateLike: Bool = false
  @State var addHeartAnimationToView: Bool
  @State var showActionSheet: Bool = false
  @State var actionSheetType: PostActionSheetOption = .general
  @State var postImage: UIImage = UIImage(named: "dog1")!
  
  enum PostActionSheetOption {
    case general, reporting
  }
  
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
          
          Button(action: { showActionSheet.toggle() },
                 label: { Image(systemName: "ellipsis").font(.headline) })
            .accentColor(.primary)
            .actionSheet(isPresented: $showActionSheet) { getActionSheet() }
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
          
          Button(action: { sharePost() }, label: {
            Image(systemName: "paperplane")
          })
          .accentColor(.primary)
          
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
  
  func getActionSheet() -> ActionSheet {
    switch actionSheetType {
    case .general:
      return ActionSheet(
        title: Text("What would you like to do?"),
        message: nil, buttons: [
          .destructive(Text("Report"),
                       action: {
                        self.actionSheetType = .reporting
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                          self.showActionSheet.toggle()
                        }
                       }),
          .default(Text("Learn More.."), action: { print("Learn more pressed") }),
          .cancel()
        ]
      )
    case .reporting:
      return ActionSheet(
        title: Text("Why are you reporting this post?"),
        message: nil, buttons: [
          .destructive(Text("This is inappropiate"), action: {
            reportPost(for: "This is inappropiate")
            actionSheetType = .general
          }),
          .destructive(Text("This is spam"), action: {
            reportPost(for: "This is spam")
            actionSheetType = .general
          }),
          .destructive(Text("It made me uncomfortable"), action: {
            reportPost(for: "It made me uncomfortable")
            actionSheetType = .general
          }),
          .cancel({ self.actionSheetType = .general })
        ]
      )
    }
  }
  
  func reportPost(for reason: String) {
    print("REPORT POST NOW!")
  }
  
  func sharePost() {
    let message: String = "Check out this post on dogGram"
    let image = postImage
    let link = URL(string: "https://google.com")!
    
    let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
    
    let viewController = UIApplication.shared.windows.first?.rootViewController
    viewController?.present(activityViewController, animated: true, completion: nil)
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: dev.post, showHeaderAndFooter: true, addHeartAnimationToView: true)
      .previewLayout(.sizeThatFits)
  }
}

