//
//  CommentModel.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
  var id = UUID()
  
  var commentID: String // The commentID comes from the database
  var userId: String // The userID comes from the database
  var username: String
  var content: String
  var dateCreated: Date
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
