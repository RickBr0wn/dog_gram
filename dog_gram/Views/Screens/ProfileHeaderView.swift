//
//  ProfileHeaderView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct ProfileHeaderView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Image("dog1")
        .resizable()
        .scaledToFill()
        .frame(width: 120, height: 120, alignment: .center)
        .cornerRadius(60.0)
      
      Text("Username")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      Text("This is where a user can display their bio..")
        .font(.body)
        .fontWeight(.regular)
        .multilineTextAlignment(.center)
      
      HStack(alignment: .center, spacing: 20) {
        VStack(alignment: .center, spacing: 5) {
          
          // MARK: Posts
          
          Text("5,812")
            .font(.title2)
            .fontWeight(.bold)
          
          Capsule()
            .fill(Color.gray)
            .frame(width: 20, height: 2, alignment: .center)
            
          
          Text("Posts")
            .font(.callout)
            .fontWeight(.medium)
        }
        
        //MARK: Followers
        
        VStack(alignment: .center, spacing: 5) {
          Text("10,950")
            .font(.title2)
            .fontWeight(.bold)
          
          Capsule()
            .fill(Color.gray)
            .frame(width: 20, height: 2, alignment: .center)
          
          
          Text("Likes")
            .font(.callout)
            .fontWeight(.medium)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
