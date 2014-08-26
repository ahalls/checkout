//
//  Checkout.swift
//  Checkout
//
//  Created by Andrew Halls on 8/25/14.
//  Copyright (c) 2014 Gaggle. All rights reserved.
//

import Foundation

struct PriceItem {
  let price: Int
  let qty: Int
  let function: (Int,Int)-> Int
}

class Checkout {
  var total: Int {
    get{
      return Array(priceTable).reduce(0) {
        (acc: Int, tuple: (String,PriceItem)) -> Int in
          return acc + tuple.1.function(tuple.1.price, tuple.1.qty)
      }
    }
  }

  
  func appleSpecial(price: Int, _ qty:Int) -> Int {
    return (qty / 3) * price * 2 + ((qty % 3) * price)
  }

  func cherriesSpecial(price: Int, _ qty:Int) -> Int {
    var discounted = Int(Float((qty / 3) * price) * 1.5)
    var normal = ((qty % 3) * price)
    return discounted + normal
  }

  func oldCherriesSpecial(price: Int, _ qty:Int) -> Int {
    let newPrice = Float(price) * 0.8
    return Int( Float(qty) * newPrice)
  }


  func noDiscount(price: Int, _ qty:Int) -> Int {
    return price * qty
  }

    var priceTable = Dictionary<String,PriceItem>()
  init() {
    priceTable["apple"] = PriceItem(price:50, qty:0, function: appleSpecial)
    priceTable["cherries"] = PriceItem(price:500, qty:0, function: cherriesSpecial)
    priceTable["old_cherries"] = PriceItem(price:500, qty:0, function: oldCherriesSpecial)
    priceTable["mangos"] = PriceItem(price:300, qty:0, function: noDiscount)

  }


  func addItem(item: String, _ quantity: Int = 1) {

    if let priceItem = priceTable[item] {
      priceTable[item] = PriceItem(price:priceItem.price, qty:priceItem.qty + quantity, function:priceItem.function)
    }

  }

}