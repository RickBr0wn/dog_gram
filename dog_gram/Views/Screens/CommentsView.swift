//
//  CommentsView.swift
//  dog_gram
//
//  Created by Rick Brown on 15/09/2021.
//

import SwiftUI

struct CommentsView: View {
  @State private var submissionText: String = ""
  @State var commentArray: Array<CommentModel> = Array<CommentModel>()
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack {
          ForEach(commentArray, id: \.self) { comment in
            MessageView(comment: comment)
          }
        }
      }
      
      HStack {
        Image("dog1")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40, alignment: .center)
          .cornerRadius(20)
        
        TextField("Add a comment here", text: $submissionText)
        
        Button(action: {}, label: {
          Image(systemName: "paperplane.fill")
            .font(.title2)
        })
        .accentColor(colorScheme == .light ? Color.app.purple : Color.app.yellow)
      }
      .padding(.all, 6)
    }
    padding()
    .navigationBarTitle("Comments")
    .navigationBarTitleDisplayMode(.inline)
    .onAppear(perform: getComments)
  }
  
  // MARK: Functions
  
  func getComments() {
    let comment1 = CommentModel(commentID: "1", userId: "1", username: "1", content: "1", dateCreated: Date())
    let comment2 = CommentModel(commentID: "2", userId: "2", username: "2", content: "2", dateCreated: Date())
    let comment3 = CommentModel(commentID: "3", userId: "3", username: "3", content: "3", dateCreated: Date())
    let comment4 = CommentModel(commentID: "4", userId: "4", username: "4", content: "4", dateCreated: Date())
    
    commentArray.append(comment1)
    commentArray.append(comment2)
    commentArray.append(comment3)
    commentArray.append(comment4)
  }
}

struct CommentsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      Group {
        CommentsView()
          .preferredColorScheme(.dark)
        
        CommentsView()
      }
    }
  }
}
