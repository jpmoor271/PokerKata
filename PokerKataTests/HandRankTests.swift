//
//  HandRankTests.swift
//  PokerKata
//
//  Created by Jason Moore on 1/28/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import XCTest
@testable import PokerKata

class HandRankTests: XCTestCase {
  
  func testRankOrder() {
    XCTAssertTrue(HandRank.highCard < HandRank.pair, "Expected high card to be lower than pair")
    XCTAssertTrue(HandRank.pair < HandRank.twoPair, "Expected pair to be lower than two pair")
    XCTAssertTrue(HandRank.twoPair < HandRank.threeOfAKind, "Expected two pair to be lower than three of a kind")
    XCTAssertTrue(HandRank.threeOfAKind < HandRank.straight, "Expected three of a kind to be lower than straight")
    XCTAssertTrue(HandRank.straight < HandRank.flush, "Expected straight to be lower than flush")
    XCTAssertTrue(HandRank.flush < HandRank.fullHouse, "Expected flush to be lower than full house")
    XCTAssertTrue(HandRank.fullHouse < HandRank.fourOfAKind, "Expected full house to be lower than four of a kind")
    XCTAssertTrue(HandRank.fourOfAKind < HandRank.straightFlush, "Expected four of a kind to be lower than straight flush")
    
    XCTAssertFalse(HandRank.highCard > HandRank.straightFlush, "Expected high card to not be higher than straight flush")
  }
}
