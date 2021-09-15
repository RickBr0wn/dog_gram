//
//  FeedView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct FeedView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false, content: {
      PostView()
      PostView()
      PostView()
      PostView()
      PostView()
      PostView()
      PostView()
      
    })
    .navigationBarTitle("Feed View")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      FeedView()
    }
  }
}
