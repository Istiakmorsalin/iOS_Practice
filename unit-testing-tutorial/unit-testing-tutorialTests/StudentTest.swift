//
//  StudentTest.swift
//  unit-testing-tutorialTests
//
//  Created by ISTIAK on 6/5/20.
//  Copyright © 2020 istiak. All rights reserved.
//

import Foundation
import XCTest

@testable import unit_testing_tutorial

class StudentTest: XCTestCase {
   
    func testInvalidFirstName() {
        let student = Student(firstName: "Is", lastName: "Morsalin")
        XCTAssertFalse(student.validFirstName())
    }
    
    
    func testValidLastName () {
         let student = Student(firstName: "Is", lastName: "Morsalin")
        XCTAssertTrue(student.validLastName())
    }
    
    func testAddFriend() {
         let student1 = Student(firstName: "Istiak", lastName: "Morsalin")
        
         let student2 = Student(firstName: "Tasnim", lastName: "Onisha")
        
        XCTAssertTrue(student1.friends.count == 0)
        
        student1.addFriend(friend: student2)
        
        XCTAssertFalse(student1.friends.count == 0)
    }
    
}
