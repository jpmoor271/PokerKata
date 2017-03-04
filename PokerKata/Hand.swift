//
//  Hand.swift
//  PokerKata
//
//  Created by Jason Moore on 2/5/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import Foundation

struct Hand {
  let cards: [Card]
  
  var highCard: Card {
    get {
      return cards.sorted().last!
    }
  }
  
  init(cards: [Card]) {
    self.cards = cards
  }
  
  init?(with cardString: String) {
    var cardsInHand = [Card]()
    for card in cardString.characters.split(separator: " ") {
      if let parsedCard = Card(from: String(card)) {
        cardsInHand.append(parsedCard)
      }
    }
    
    if cardsInHand.count == 5 {
      self.cards = cardsInHand
      return
    } else {
      return nil
    }
  }
  
  func bestHandRank() -> HandRank {
    // Check for flush
    var suitCounts = [CardSuit : Int]()
    for card in self.cards {
      if let currentSuitCount = suitCounts[card.suit] {
        suitCounts[card.suit] = currentSuitCount + 1
      } else {
        suitCounts[card.suit] = 1
      }
    }
    
    for (_, count) in suitCounts {
      if count == 5 {
        return .flush
      }
    }
    
    // Check for straight
    let sortedCards = self.cards.sorted()
    let lowestRank = sortedCards[0].rank.rawValue
    let expectedHighestRank = lowestRank + 4
    
    if let lastCardRank = sortedCards.last?.rank {
      if lastCardRank.rawValue == expectedHighestRank {
        return .straight
      }
    }
    
    // Check for single-rank hands (i.e., high card, pair, three of a kind, four of a kind)
    var rankCounts = [CardRank:Int]()
    
    for card in self.cards {
      if let currentRankCount = rankCounts[card.rank] {
        rankCounts[card.rank] = currentRankCount + 1
      } else {
        rankCounts[card.rank] = 1
      }
    }
    
    var maxRankCount = 0
    for (_, count) in rankCounts {
      if count > maxRankCount {
        maxRankCount = count
      }
    }

    switch maxRankCount {
    case 2:
      return .pair
    case 3:
      return .threeOfAKind
    case 4:
      return .fourOfAKind
    default:
      return .highCard
    }
  }
}



// MARK - Comparable Support

extension Hand: Comparable {
  
  static func < (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.highCard < rhs.highCard
  }
  
  
  static func == (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.highCard == rhs.highCard
  }
  
  static func > (lhs: Hand, rhs: Hand) -> Bool {
    return lhs.highCard > rhs.highCard
  }
  
}
