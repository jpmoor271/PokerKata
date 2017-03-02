//
//  HandTests.swift
//  PokerKata
//
//  Created by Jason Moore on 2/5/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import XCTest
@testable import PokerKata

class HandTests: XCTestCase {
  
  func testFiveCards() {
    let hand = Hand(with: "AS KS QS JS 10S")
    
    XCTAssertTrue(hand?.cards.count == 5, "Expected hand to have five cards")
  }
  
  
  func testHighCard() {
    XCTAssertTrue(Hand(with: "AS KS QS JS 10S")!.highCard == Card(from: "AS")!, "Expected ace of spades to be high card.")
  }
  
  func testAceHighWins() {
    let aceHighHand = "AS 2S 2H 2D 2C"
    let kingHighHand = "KS KH KC KD QS"
    
    XCTAssertTrue(Hand(with: aceHighHand)! > Hand(with: kingHighHand)!, "Expected ace high hand to be higher than king high.")
    XCTAssertFalse(Hand(with: kingHighHand)! > Hand(with: aceHighHand)!, "Expected king high hand to not be higher than ace high.")
  }
  
  func testHighCardWithNoEqualRanks() {
    let aceHighHand = "AS 2S 2H 2D 2C"
    let kingHighHand = "KS QH JC 10S 9S"
    let queenHighHand = "QS JD 10C 9S 8D"
    let jackHighHand = "JS 10D 9C 8S 7H"
    
    XCTAssertTrue(Hand(with: aceHighHand)! > Hand(with: kingHighHand)!, "Expected ace high hand to beat king high hand")
    XCTAssertTrue(Hand(with: kingHighHand)! > Hand(with: queenHighHand)!, "Expected king high hand to beat queen high hand.")
    XCTAssertTrue(Hand(with: aceHighHand)! > Hand(with: queenHighHand)!, "Expected ace high hand to beat queen high hand.")
    XCTAssertTrue(Hand(with: queenHighHand)! > Hand(with: jackHighHand)!, "Expected queen high hand to beat jack high hand.")
  }
  
  func testBestHand() {
    let highCardHand = "10C 9S 3C 2D 6S"
    XCTAssertTrue(Hand(with: highCardHand)!.bestHandRank() == .highCard, "Expected best hand to be high card")
    
    let pairHand = "AS AC 2H 3S JD"
    XCTAssertTrue(Hand(with: pairHand)!.bestHandRank() == .pair, "Expected best hand to be a pair")
    
    let threeOfAKindHand = "QH JS JD 9C JH"
    XCTAssertTrue(Hand(with: threeOfAKindHand)!.bestHandRank() == .threeOfAKind, "Expected best hand to be a three of a kind")
    
    let fourOfAKindHand = "8S JC 8C 8D 8H"
    XCTAssertTrue(Hand(with: fourOfAKindHand)!.bestHandRank() == .fourOfAKind, "Expected best hand to be a four of a kind")
    
    let straightHand = "7H 8S 9C 10S JC"
    XCTAssertTrue(Hand(with: straightHand)!.bestHandRank() == .straight, "Expected best hand to be a straight")
    
  }

}
