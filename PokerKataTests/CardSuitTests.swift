//
//  CardSuitTests.swift
//  PokerKata
//
//  Created by Jason Moore on 1/29/17.
//  Copyright © 2017 Jason Moore. All rights reserved.
//

import XCTest
@testable import PokerKata

class CardSuitTests: XCTestCase {
  
  func testValidSuits() {
    for suitString in ["H", "D", "S", "C"] {
      guard let _ = CardSuit(rawValue: suitString) else {
        XCTFail("Expected valid CardSuit for string value \(suitString)")
        return
      }
    }
  }
  
  func testInvalidSuits() {
    let testSuitString = "R"
    XCTAssertNil(CardSuit(rawValue: testSuitString), "Expected unknown CardSuit for input string \(testSuitString)")
  }
  
}
