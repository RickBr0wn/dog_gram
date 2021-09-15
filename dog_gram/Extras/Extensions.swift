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
      Color("BeigeColor")
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
  
  let post = PostModel(postID: "postId12345", userID: "userID1234", username: "username", caption: "a random caption", dateCreated: Date(), likeCount: 42, isLikedByUser: true)
  
  let posts = PostArrayObject()
  
}