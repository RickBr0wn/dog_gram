//
//  PostModel.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
  var id = UUID()
  // postID - to carry the post id from the database
  var postID: String
  // userID - to carry the user id from the database
  var userID: String
  // userName
  var username: String
  // caption - optional
  var caption: String?
  // date - date post was created
  var dateCreated: Date
  // 'like' count
  var likeCount: Int
  // is this post 'liked' by the user
  var isLikedByUser: Bool
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
