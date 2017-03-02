//
//  Card.swift
//  PokerKata
//
//  Created by Jason Moore on 1/28/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import Foundation

struct Card {
  let rank: CardRank
  let suit: CardSuit
  
  init(rank: CardRank, suit: CardSuit) {
    self.rank = rank
    self.suit = suit
  }
  
  init?(from inputString: String) {
    guard inputString.characters.count >= 2 else {
      return nil
    }
    
    let lastCharacter = inputString.characters.last
    if let lastCharacter = lastCharacter, let suit = CardSuit(rawValue: String(lastCharacter)) {
      if let indexOfSuit = inputString.characters.index(of: lastCharacter) {
        let rankString = inputString.characters.prefix(upTo: indexOfSuit)
        
        if let rank = CardRank(from: String(rankString)) {
          self.init(rank: rank, suit: suit)
          return
        }
      }
    }
    
    return nil
  }
}




// MARK - Comparable Conformance

extension Card: Comparable {
  static func < (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank < rhs.rank
  }
  
  static func == (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank == rhs.rank
  }
  
  static func > (lhs: Card, rhs: Card) -> Bool {
    return lhs.rank > rhs.rank
  }
}
