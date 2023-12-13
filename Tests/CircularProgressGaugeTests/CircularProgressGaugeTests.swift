//
//  CircularProgressGaugeTests.swift
//  
//
//  Created by Kevin Mullins on 5/14/21.
//

import XCTest
import SwiftUI
@testable import CircularProgressGauge

final class SwiftUtilitiesTests: XCTestCase {
    
    func testCircularProgressGauge() {
        @State var n:Float = 0.5
        let gauge:CircularProgressGauge? = CircularProgressGauge(progress: $n)
        XCTAssert(gauge != nil)
    }
}
