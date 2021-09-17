//
//  SettingsLabelView.swift
//  dog_gram
//
//  Created by Rick Brown on 17/09/2021.
//

import SwiftUI

struct SettingsLabelView: View {
  var labelText: String
  var labelImage: String
  
  var body: some View {
    VStack {
      HStack {
        Text(labelText)
          .fontWeight(.bold)
        
        Spacer()
        
        Image(systemName: labelImage)
      }
      
      Divider()
        .padding(.vertical, 4)
        
    }
  }
}

struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Development label", labelImage: "heart")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}