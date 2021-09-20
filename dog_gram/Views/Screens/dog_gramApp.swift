//
//  dog_gramApp.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI
import FirebaseCore

@main
struct dog_gramApp: App {
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
