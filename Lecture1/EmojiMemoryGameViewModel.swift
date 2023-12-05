//
//  EmojiMemoryGame.swift
//  Lecture1
//
//  Created by Muhammad Wildhan on 04/12/23.
//

import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
  private static let emojis = ["👻", "💀", "🎃", "😈", "☠️", "🕷️", "🕸️", "🍬", "😱", "🙀", "👺", "👹", "👻", "💀", "🎃", "😈", "☠️", "🕷️", "🕸️", "🍬", "😱", "🙀", "👺", "👹"]

  private static func createMemoryGame() -> MemoryGame<String> {
    return MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
      if emojis.indices.contains(pairIndex) {
        return emojis[pairIndex]
      } else {
        return "⁉️"
      }
    }
  }

  @Published private var model = createMemoryGame()

  var cards: [MemoryGame<String>.Card] {
    return model.cards
  }

  func shuffle() {
    model.shuffle()
  }

  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
