//
//  PostArrayObject.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import Foundation
import SwiftUI

class PostArrayObject: ObservableObject {
  @Published var dataArray: Array<PostModel> = Array<PostModel>()
  
  /// Initializer creates a mock .dataArray containing 4 development posts.
  init() {
    // Fetch posts from database
    // Fake posts x4
    let post1 = PostModel(postID: "postId12345", userID: "userID1234", username: "username", caption: "a random caption", dateCreated: Date(), likeCount: 42, isLikedByUser: true)
    let post2 = PostModel(postID: "postId12346", userID: "userID1235", username: "username2", caption: "another random caption", dateCreated: Date(), likeCount: 64, isLikedByUser: true)
    let post3 = PostModel(postID: "postId12347", userID: "userID1236", username: "username3", caption: nil, dateCreated: Date(), likeCount: 127, isLikedByUser: true)
    let post4 = PostModel(postID: "postId12348", userID: "userID1237", username: "usernam4", caption: "yes, you guessed it! a random caption lolol", dateCreated: Date(), likeCount: 42, isLikedByUser: true)
    
    self.dataArray.append(post1)
    self.dataArray.append(post2)
    self.dataArray.append(post3)
    self.dataArray.append(post4)
  }
  
  /// Used for single post selection.
  init(post:PostModel) {
    self.dataArray.append(post)
  }
}
