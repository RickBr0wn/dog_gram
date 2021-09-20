//
//  ContentView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct ContentView: View {
  var currentUserID: String? = nil
  
  var body: some View {
    TabView {
      NavigationView {
        FeedView(posts: PostArrayObject(), title: "Feed")
      }
      .tabItem {
        Image(systemName: "book.fill")
        Text("Feed")
      }
      
      NavigationView {
        BrowseView()
      }
      .tabItem {
        Image(systemName: "magnifyingglass")
        Text("Browse")
      }
      
      UploadView()
        .tabItem {
          Image(systemName: "square.and.arrow.up.fill")
          Text("Upload")
        }
      
      ZStack {
        if currentUserID != nil {
          NavigationView {
            ProfileView(displayName: "My Profile Name", profileUserID: "A_RANDOM_USER_ID", isMyProfile: true)
          }
        } else {
          SignUpView()
        }
      }
      .tabItem {
        Image(systemName: "person.fill")
        Text("Profile")
      }
    }
    .accentColor(Color.app.purple)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
