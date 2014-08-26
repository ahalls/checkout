//
//  CheckoutTests.swift
//  CheckoutTests
//
//  Created by Andrew Halls on 8/25/14.
//  Copyright (c) 2014 Gaggle. All rights reserved.
//

import UIKit
import XCTest

class CheckoutTests: XCTestCase {
    
    
  func testItShouldOneAppleReturn50Cents (){
    var co = Checkout()
    co.addItem("apple")
    XCTAssert(co.total == 50 )

  }


  func testItShouldTwoAppleReturn100Cents (){
    var co = Checkout()
    co.addItem("apple")
    co.addItem("apple")
    XCTAssert(co.total == 100 )

  }


  func testItShouldBasket850 (){
    var co = Checkout()
    co.addItem("apple")
    co.addItem("cherries")
    co.addItem("mangos")
    XCTAssert(co.total == 850 )

  }

  func testItShould3applesOneDollar (){
    var co = Checkout()
    co.addItem("apple",3)

    XCTAssert(co.total == 100 )

  }

  func testItShould3applesSequOneDollar (){
    var co = Checkout()
    co.addItem("apple")
    co.addItem("apple")
    co.addItem("apple")

    XCTAssertEqual(co.total, 100 )
    
  }

  func testItShould4applesOneDollar (){
    var co = Checkout()
    co.addItem("apple",4)

    XCTAssert(co.total == 150 )
    
  }
  

  func testItShould3aCherries750 (){
    var co = Checkout()
    co.addItem("cherries",3)

    XCTAssertEqual(co.total, 750 )

  }

  func testItShouldTwoCherries1000 () {

    var co = Checkout()
    co.addItem("cherries",2)

    XCTAssertEqual(co.total, 1000 )
    

  }


  func testItShouldFourCherries1250 () {

    var co = Checkout()
    co.addItem("cherries",4)

    XCTAssertEqual(co.total, 1250 )
    
    
  }

  func testItShouldTwoOldCherries800 () {

    var co = Checkout()
    co.addItem("old_cherries",2)

    XCTAssertEqual(co.total, 800 )

  }



}
