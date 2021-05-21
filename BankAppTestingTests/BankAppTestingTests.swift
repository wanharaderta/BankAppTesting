//
//  BankAppTestingTests.swift
//  BankAppTestingTests
//
//  Created by Wanhar on 21/05/21.
//

import XCTest
@testable import BankAppTesting

class BankAppTestingTests: XCTestCase {
  
  private var account: Account!
  
  //this function is called BEFORE each test
  override func setUp() {
    super.setUp()
    self.account = Account()
    
  }
  
  func testInitialBalanceZeor() throws {
    XCTAssertTrue(self.account.balance == 0,"Balance is not Zero!")
  }
  
  func testDepositeFunds(){
    self.account.balance = 100
    XCTAssertEqual(100, self.account.balance, "Balance is not same deposite")
  }
  
  func testWithdrawFunds(){
    self.account.deposite(100)
    try? self.account.withdraw(50)
    XCTAssertEqual(50, self.account.balance)
  }
  
  func testWithdrawFromInsufficientBalance(){
    self.account.deposite(100)
    //should error
    XCTAssertThrowsError(try self.account.withdraw(300)) { error in
      XCTAssertEqual(error as! AccountError, AccountError.insufficientFunds)
    }
    
    //should success
    XCTAssertEqual(100, self.account.balance)
  }
  
}
