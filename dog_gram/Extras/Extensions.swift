//
//  Extensions.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import Foundation
import SwiftUI

extension Color {
  struct app {
    static var purple: Color {
      Color("ColorPurple")
    }
    
    static var yellow: Color {
      Color("ColorYellow")
    }
    
    static var beige: Color {
      Color("ColorBeige")
    }
  }
}

extension PreviewProvider {
  static var dev: DeveloperPreview {
    DeveloperPreview.instance
  }
}

class DeveloperPreview {
  static let instance = DeveloperPreview()
  
  private init() {}
  
  @State var profileDisplayName = "development.name.with.binding"
  
  @State var animateBoolean: Bool = false
  
  let post = PostModel(postID: "post.Id", userID: "user.ID", username: "username.post", caption: "development.caption", dateCreated: Date(), likeCount: 42, isLikedByUser: false)
  
  let posts = PostArrayObject()
  
  let comment = CommentModel(commentID: "comment.Id", userId: "user.Id", username: "username.comment", content: "development.comment", dateCreated: Date())
  
  let title = "development.title"
  
  let userID = "user.id"
  
  let description = "development.description"
  
  let placeholder = "development.placeholder"
}
