//
//  ProfileView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct ProfileView: View {
  var posts = PostArrayObject()
  @State var displayName: String
  var profileUserID: String
  var isMyProfile: Bool
  @State var isSheetShown: Bool = false
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false, content: {
      ProfileHeaderView(profileDisplayName: $displayName)
      
      Divider()
      
      ImageGridView(posts: posts)
    })
    .navigationBarTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing: Button(action: { isSheetShown.toggle() }, label: {
      Image(systemName: "line.horizontal.3")
    })
    .accentColor(.app.purple)
    .opacity(isMyProfile ? 1.0 : 0)
    )
    .sheet(isPresented: $isSheetShown) { SettingsView() }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProfileView(displayName: dev.profileDisplayName, profileUserID: dev.userID, isMyProfile: true)
    }
  }
}
  
