//
//  CaroselView.swift
//  dog_gram
//
//  Created by Rick Brown on 16/09/2021.
//

import SwiftUI

struct CarouselView: View {
  @State var selection: Int = 1
  private let maxCount: Int = 8
  @State private var isTimerAdded: Bool = false
  
  var body: some View {
    TabView(selection: $selection,
            content:  {
              ForEach(1..<maxCount) { i in
                Image("dog\(i)")
                  .resizable()
                  .scaledToFill()
                  .tag(i)
              }
            })
      .tabViewStyle(PageTabViewStyle())
      .frame(height: 300)
      .animation(.default)
      .onAppear(perform: {
        if !isTimerAdded {
          addTimer()
        }
      })
  }
  
  // MARK: Functions
  
  private func addTimer() {
    isTimerAdded = true
    
    let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
      selection == maxCount - 1 ? (selection = 1) : (selection += 1)
    }
    timer.fire()
  }
}

struct CaroselView_Previews: PreviewProvider {
  static var previews: some View {
    CarouselView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
