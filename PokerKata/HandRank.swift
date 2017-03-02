//
//  HandRank.swift
//  PokerKata
//
//  Created by Jason Moore on 1/28/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import Foundation

enum HandRank: Int {
  case highCard, pair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush
}


// MARK - Comparable Support

extension HandRank: Comparable {
  
  static func < (lhs: HandRank, rhs: HandRank) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
  
  static func == (lhs: HandRank, rhs: HandRank) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
  
  static func > (lhs: HandRank, rhs: HandRank) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
}
