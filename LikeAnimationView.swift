//
//  LikeAnimationView.swift
//  dog_gram
//
//  Created by Rick Brown on 20/09/2021.
//

import SwiftUI

struct LikeAnimationView: View {
  @Binding var animate: Bool
  
  var body: some View {
    ZStack {
      Image(systemName: "heart.fill")
        .font(.system(size: 200))
        .foregroundColor(Color.red.opacity(0.3))
        .opacity(animate ? 1.0 : 0.0)
        .scaleEffect(animate ? 1.0 : 0.3)
      
      Image(systemName: "heart.fill")
        .font(.system(size: 150))
        .foregroundColor(Color.red.opacity(0.6))
        .opacity(animate ? 1.0 : 0.0)
        .scaleEffect(animate ? 1.0 : 0.4)
      
      Image(systemName: "heart.fill")
        .font(.system(size: 100))
        .foregroundColor(Color.red.opacity(0.9))
        .opacity(animate ? 1.0 : 0.0)
        .scaleEffect(animate ? 1.0 : 0.5)
    }
    .animation(Animation.easeInOut(duration: 0.5))
  }
}

struct LikeAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    LikeAnimationView(animate: dev.$animateBoolean)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
