//
//  CardTests.swift
//  PokerKata
//
//  Created by Jason Moore on 1/28/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import XCTest
@testable import PokerKata

class CardTests: XCTestCase {
  
  let fullDeck = ["AS": (CardRank.ace, CardSuit.spades),
                  "KS": (CardRank.king, CardSuit.spades),
                  "QS": (CardRank.queen, CardSuit.spades),
                  "JS": (CardRank.jack, CardSuit.spades),
                  "10S": (CardRank.ten, CardSuit.spades),
                  "9S": (CardRank.nine, CardSuit.spades),
                  "8S": (CardRank.eight, CardSuit.spades),
                  "7S": (CardRank.seven, CardSuit.spades),
                  "6S": (CardRank.six, CardSuit.spades),
                  "5S": (CardRank.five, CardSuit.spades),
                  "4S": (CardRank.four, CardSuit.spades),
                  "3S": (CardRank.three, CardSuit.spades),
                  "2S": (CardRank.two, CardSuit.spades),
                  "AH": (CardRank.ace, CardSuit.hearts),
                  "KH": (CardRank.king, CardSuit.hearts),
                  "QH": (CardRank.queen, CardSuit.hearts),
                  "JH": (CardRank.jack, CardSuit.hearts),
                  "10H": (CardRank.ten, CardSuit.hearts),
                  "9H": (CardRank.nine, CardSuit.hearts),
                  "8H": (CardRank.eight, CardSuit.hearts),
                  "7H": (CardRank.seven, CardSuit.hearts),
                  "6H": (CardRank.six, CardSuit.hearts),
                  "5H": (CardRank.five, CardSuit.hearts),
                  "4H": (CardRank.four, CardSuit.hearts),
                  "3H": (CardRank.three, CardSuit.hearts),
                  "2H": (CardRank.two, CardSuit.hearts),
                  "AC": (CardRank.ace, CardSuit.clubs),
                  "KC": (CardRank.king, CardSuit.clubs),
                  "QC": (CardRank.queen, CardSuit.clubs),
                  "JC": (CardRank.jack, CardSuit.clubs),
                  "10C": (CardRank.ten, CardSuit.clubs),
                  "9C": (CardRank.nine, CardSuit.clubs),
                  "8C": (CardRank.eight, CardSuit.clubs),
                  "7C": (CardRank.seven, CardSuit.clubs),
                  "6C": (CardRank.six, CardSuit.clubs),
                  "5C": (CardRank.five, CardSuit.clubs),
                  "4C": (CardRank.four, CardSuit.clubs),
                  "3C": (CardRank.three, CardSuit.clubs),
                  "2C": (CardRank.two, CardSuit.clubs),
                  "AD": (CardRank.ace, CardSuit.diamonds),
                  "KD": (CardRank.king, CardSuit.diamonds),
                  "QD": (CardRank.queen, CardSuit.diamonds),
                  "JD": (CardRank.jack, CardSuit.diamonds),
                  "10D": (CardRank.ten, CardSuit.diamonds),
                  "9D": (CardRank.nine, CardSuit.diamonds),
                  "8D": (CardRank.eight, CardSuit.diamonds),
                  "7D": (CardRank.seven, CardSuit.diamonds),
                  "6D": (CardRank.six, CardSuit.diamonds),
                  "5D": (CardRank.five, CardSuit.diamonds),
                  "4D": (CardRank.four, CardSuit.diamonds),
                  "3D": (CardRank.three, CardSuit.diamonds),
                  "2D": (CardRank.two, CardSuit.diamonds)]
  
  func testInitializeFromStringForFullDeck() {
    for card in fullDeck {
      let initString = card.key
      let (cardRank, cardSuit) = card.value
      guard let initializedCard = Card(from: initString) else {
        XCTFail("Expected successful card initialization for initialization string \(initString)")
        return
      }
      
      XCTAssertEqual(initializedCard.rank, cardRank)
      XCTAssertEqual(initializedCard.suit, cardSuit)
    }
  }
  
  func testInitializeFromStringForInvalidSuit() {
    let initString = "KB"
    
    XCTAssertNil(Card(from: initString), "Expected initialization failure for card with input string \(initString)")
    
  }

  func testInitializeFromStringForInvalidRank() {
    let initString = "RS"
    
    XCTAssertNil(Card(from: initString), "Expected initialization failure for card with input string \(initString)")
  }
  
  func testInitializeFromStringForInvalidLengthString() {
    let initString = "A"
    
    XCTAssertNil(Card(from: initString), "Expected initialization failure for card with input string \(initString)")
  }
  
  func testEqualRank() {
    XCTAssertTrue(Card(rank: .ace, suit: .spades) == Card(rank: .ace, suit: .hearts), "Expected ace of spades and ace of hearts to have equal rank")
    XCTAssertTrue(Card(from: "JC") == Card(from: "JD"), "Expected jack of clubs and jack of diamonds to have equal rank")
  }
  
  func testHigherRank() {
    guard let kingOfHearts = Card(from: "KH"), let tenOfClubs = Card(from: "10C") else {
      XCTFail("Could not initialize card")
      return
    }
    
    XCTAssertTrue(kingOfHearts > tenOfClubs, "Expected king of hearts to have higher rank than ten of clubs")
  }
  
}
