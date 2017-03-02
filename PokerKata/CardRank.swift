//
//  CardRank.swift
//  PokerKata
//
//  Created by Jason Moore on 1/29/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import Foundation

enum CardRank: Int {
  case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
  
  init?(from stringValue: String) {
    switch stringValue {
    case "A":
      self.init(rawValue: 14)
    case "K":
      self.init(rawValue: 13)
    case "Q":
      self.init(rawValue: 12)
    case "J":
      self.init(rawValue: 11)
    case "2", "3", "4", "5", "6", "7", "8", "9", "10":
      self.init(rawValue: Int(stringValue)!)
    default:
      return nil
    }
  }
}


// MARK: Comparable conformance
extension CardRank: Comparable {
  
  static func < (lhs: CardRank, rhs: CardRank) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
  
  static func == (lhs: CardRank, rhs: CardRank) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
  
}
