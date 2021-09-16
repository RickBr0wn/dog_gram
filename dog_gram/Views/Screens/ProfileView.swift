//
//  ProfileView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false, content: {
      ProfileHeaderView()
    })
    .navigationBarTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing: Button(action: {
      
    }, label: {
      Image(systemName: "line.horizontal.3")
    })
    .accentColor(.app.purple)
    )
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProfileView()
    }
  }
}
