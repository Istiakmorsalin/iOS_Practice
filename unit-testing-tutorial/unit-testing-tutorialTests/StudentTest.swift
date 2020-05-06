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
    
}
