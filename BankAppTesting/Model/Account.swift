//
//  Account.swift
//  BankAppTesting
//
//  Created by Wanhar on 21/05/21.
//

import Foundation

struct Account {
  var balance: Double = 0.0
  
  mutating func deposite(_ amount: Double){
    self.balance += amount
  }
  
  mutating func withdraw(_ amount: Double) throws {
    let netBalance = self.balance - amount
    if netBalance < 0 {
      throw AccountError.insufficientFunds
    } else {
      self.balance -= amount
    }
  }
}

enum AccountError: Error {
  case insufficientFunds
}
