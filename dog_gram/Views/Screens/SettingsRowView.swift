//
//  SettingsRowView.swift
//  dog_gram
//
//  Created by Rick Brown on 17/09/2021.
//

import SwiftUI

struct SettingsRowView: View {
  var leftIcon: String
  var text: String
  var color: Color
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8.0, style: .continuous)
          .fill(color)
        
        Image(systemName: leftIcon)
          .foregroundColor(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(text)
        .font(.title3)
        .foregroundColor(.primary)
      
      Spacer()
      
      Image(systemName: "chevron.right")
        .font(.headline)
        .foregroundColor(.primary)
    }
    .padding(.vertical, 4)
  }
}

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsRowView(leftIcon: "heart.fill", text: "Development title", color: Color.green)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
