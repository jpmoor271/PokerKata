//
//  CardRankTests.swift
//  PokerKata
//
//  Created by Jason Moore on 1/29/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import XCTest
@testable import PokerKata

class CardRankTests: XCTestCase {
  
  func testThirteenRanks() {
    for integerRank in 2...14 {
      XCTAssertNotNil(CardRank(rawValue: integerRank), "Expected CardRank with value \(integerRank)")
    }
  }
  
  func testUnknownRanks() {
    let fifteen = 15
    XCTAssertNil(CardRank(rawValue: fifteen), "Expected no CardRank with value \(fifteen)")
    
    let zero = 0
    XCTAssertNil(CardRank(rawValue: zero), "Expectedf no CardRank with value \(zero)")
  }
  
  func testHigherCardRank() {
    XCTAssertTrue(CardRank.ace > CardRank.king, "Expected ace to be higher rank than king")
    XCTAssertTrue(CardRank.king > CardRank.queen, "Expected king to be higher rank than queen")
    XCTAssertTrue(CardRank.queen > CardRank.jack, "Expected queen to be higher rank than jack")
    XCTAssertTrue(CardRank.jack > CardRank.ten, "Expected jack to be higher rank than ten")
    XCTAssertTrue(CardRank.ten > CardRank.nine, "Expected ten to be higher rank than nine")
    XCTAssertTrue(CardRank.nine > CardRank.eight, "Expected nine to be higher rank than eight")
    XCTAssertTrue(CardRank.eight > CardRank.seven, "Expected eight to be higher rank than seven")
    XCTAssertTrue(CardRank.seven > CardRank.six, "Expected seven to be higher rank than six")
    XCTAssertTrue(CardRank.six > CardRank.five, "Expected six to be higher rank than five")
    XCTAssertTrue(CardRank.five > CardRank.four, "Expected five to be higher rank than four")
    XCTAssertTrue(CardRank.four > CardRank.three, "Expected four to be higher rank than three")
    XCTAssertTrue(CardRank.three > CardRank.two, "Expected three to be higher rank than two")
    
    XCTAssertFalse(CardRank.four > CardRank.king, "Expected four to NOT be higher rank than king")
  }
  
  func testEqualCardRank() {
    XCTAssertTrue(CardRank.ace == CardRank.ace, "Expected ace to be ranked the same as ace")
    XCTAssertTrue(CardRank.king == CardRank.king, "Expected king to be ranked the same as king")
    XCTAssertTrue(CardRank.queen == CardRank.queen, "Expected queen to be ranked the same as queen")
    
    XCTAssertFalse(CardRank.jack == CardRank.three, "Expected jack to NOT be ranked the same as three")
  }
}
