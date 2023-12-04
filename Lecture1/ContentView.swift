//
//  ContentView.swift
//  Lecture1
//
//  Created by Muhammad Wildhan on 03/12/23.
//

import SwiftUI

struct ContentView: View {
  let emojis = ["👻", "💀", "🎃", "😈", "☠️", "🕷️", "🕸️", "🍬", "😱", "🙀", "👺", "👹", "👻", "💀", "🎃", "😈", "☠️", "🕷️", "🕸️", "🍬", "😱", "🙀", "👺", "👹"]
  @State var cardCount = 4

  var body: some View {
    VStack {
      Spacer()
      ScrollView {
        cards
      }
      Spacer()
      cardCountAdjusters
    }
    .padding()
  }

  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0 ..< cardCount, id: \.self) { index in
        CardView(content: emojis[index])
      }
    }
    .foregroundColor(.orange)
  }

  var cardCountAdjusters: some View {
    HStack {
      cardRemover
      Spacer()
      cardAdder
    }
    .imageScale(.large)
    .font(.largeTitle)
  }

  func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
    Button(action: {
      cardCount += offset
    }, label: {
      Image(systemName: symbol)
    })
    .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
  }

  var cardAdder: some View {
    cardCountAdjusters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
  }

  var cardRemover: some View {
    cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = true

  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(content).font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      base.fill().opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

#Preview {
  ContentView()
}
