//
//  BrowseView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct BrowseView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false, content: {
      CarouselView()
    })
    .navigationBarTitle("Browse")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BrowseView()
    }
  }
}
